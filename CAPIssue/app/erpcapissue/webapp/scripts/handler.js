sap.ui.define([

],
    function () {
        "use strict";

        return {

            onMessageView: async function (oContext,aSelectedContext, that) {
                console.log("============================== Message View ==============================");
                let oView = this.getRouting().getView();
                let fragment = sap.ui.xmlfragment("erpcapissue.erpcapissue.fragment.Message");
                if(fragment) {
                    // oView.addDependent(fragment);
                    fragment.setModel(oView.getModel());
                    fragment.open();
                }
            },

            onCancel: function (oEvent) {
                oEvent.getSource().getParent().close();
            }

        };
    }
);