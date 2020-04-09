public with sharing class CommunitiesLandingController2 {

    // Code we will invoke on page load.
    public PageReference forwardToStartPage() {
        String communityUrl = 'https://teksmart-developer-edition.na17.force.com/customercommunity/';
       String customHomePage = 'HomepageCommunity';  
       if (UserInfo.getUserType().equals('Guest')) {
        return new PageReference(communityUrl + 'CustomLogin2');
    } else {
        return new PageReference(communityUrl + customHomePage);
        }
    }

    public CommunitiesLandingController2() {}
}