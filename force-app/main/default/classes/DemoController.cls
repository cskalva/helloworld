global class DemoController {
 
    // get first page of news feed
    global ConnectApi.FeedItemPage getNewsFeed() {
        return ConnectApi.ChatterFeeds.getFeedItemsFromFeed(null, ConnectApi.FeedType.News, 'me');
    }

    // build list of wrapped feed items for display in VisualForce
    global List<feediteminfo> getNewsFeedForDisplay() {
        ConnectApi.FeedItemPage feed = getNewsFeed();      
        List<feediteminfo> result = new List<feediteminfo>();
        for (ConnectApi.FeedItem item : feed.items) {
            result.add(new FeedItemInfo(item));
        }
        
        return result;
    }
}