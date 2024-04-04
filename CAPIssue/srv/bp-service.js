const cds = require('@sap/cds');
const _ = require('lodash');

class BusinesspartnerService extends cds.ApplicationService {
    async init() {
        this.before(['CREATE', 'NEW'], async (req, next) => {
            // Ensure all keys are filled in deep creates
            if (req?.query?.INSERT?.into?.ref?.length > 1) {
                // Get to the root reference
                const aRefs = req?.query?.INSERT?.into?.ref;
                let oEntity = cds.model.definitions[typeof aRefs[0] == 'string' ? aRefs[0] : aRefs[0]?.id];
                // Traverse to the second-last entity
                for (let i = 1; i < aRefs.length - 1; i++) {
                    oEntity = cds.model.definitions[oEntity.compositions?.[aRefs[i]]?.target];
                }
                const oComposition = oEntity.compositions?.[aRefs[aRefs.length - 1]];
                const aOnCondition = oComposition?.on;
                let oProps = {};
                for (var j = 0; j < aOnCondition.length; j += 4) {
                    let [a, op, b, c] = aOnCondition.slice(j);
                    if (c && c != 'and' || op != '=') {
                        break; // Dont touch if it is not a simple "a=b and c=d..." type condition
                    }
                    let sParent, sChild;
                    [a, b].forEach(xpr => {
                        if (xpr.ref[0] == oComposition.name && xpr.ref.length == 2) sChild = xpr.ref[1];
                        else if (xpr.ref[0] != oComposition.name && xpr.ref.length == 1) sParent = xpr.ref[0];
                    });
                    if (!sParent || !sChild) {
                        break; // Dont touch if it is not a simple "a=b and c=d..." type condition
                    }
                    // Fetch data not already present in the URI key
                    if (req?.query?.INSERT?.entries?.some(x => !x[sChild])) {
                        oProps[sParent] = sChild;
                    }
                }
                if (!_.isEmpty(oProps)) {
                    const oParent = await SELECT.one.from({ ref: aRefs.slice(0, aRefs.length - 1) }, _.keys(oProps));
                    if (oParent) {
                        const oChild = {};
                        _.forEach(oProps, (sChild, sParent) => {
                            oChild[sChild] = oParent[sParent];
                        });
                        req?.query?.INSERT?.entries?.forEach(x => _.assign(x, oChild));
                    }
                }
            }
        });

        return super.init();
    }
};

module.exports = { BusinesspartnerService };