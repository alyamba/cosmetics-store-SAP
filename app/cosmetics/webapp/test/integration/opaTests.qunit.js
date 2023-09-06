sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'cosmetics/cosmetics/test/integration/FirstJourney',
		'cosmetics/cosmetics/test/integration/pages/CosmeticsList',
		'cosmetics/cosmetics/test/integration/pages/CosmeticsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CosmeticsList, CosmeticsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('cosmetics/cosmetics') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCosmeticsList: CosmeticsList,
					onTheCosmeticsObjectPage: CosmeticsObjectPage
                }
            },
            opaJourney.run
        );
    }
);