window.RSS = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {},
  Store: {},

  initialize: function($sidebar, $content, feedData, entryData) {
    RSS.Store.feeds = new RSS.Collections.Feeds(feedData);
    RSS.Store.entries = new RSS.Collections.Entries(entryData);

    this.installSidebar($sidebar);

    var router = new RSS.Routers.FeedRouter($content);
    Backbone.history.start();
  },

  installSidebar: function($sidebar) {
    var feedIndexView = new RSS.Views.FeedIndexView({
      collection: RSS.Store.feeds
    });

    $sidebar.html(feedIndexView.render().$el);
  }
};