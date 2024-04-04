sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'erpcapissue/erpcapissue/test/integration/FirstJourney',
		'erpcapissue/erpcapissue/test/integration/pages/BusinessPartnerList',
		'erpcapissue/erpcapissue/test/integration/pages/BusinessPartnerObjectPage'
    ],
    function(JourneyRunner, opaJourney, BusinessPartnerList, BusinessPartnerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('erpcapissue/erpcapissue') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBusinessPartnerList: BusinessPartnerList,
					onTheBusinessPartnerObjectPage: BusinessPartnerObjectPage
                }
            },
            opaJourney.run
        );
    }
);