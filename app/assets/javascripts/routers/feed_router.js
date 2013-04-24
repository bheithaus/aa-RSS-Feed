RSS.Routers.FeedRouter = Backbone.Router.extend({
  initialize: function($element) {
    this.rootEl = $element;
  },

  routes: {
    "": "index",
    "index": "index",
    "feeds/:id": "showFeed",
  },

  showFeed: function(id) {
    console.log("i got here");
    var feed = RSS.Store.feeds.get(id);
    console.log(feed.toJSON());
    var feedView = new RSS.Views.FeedView({
      model: feed
    });
    console.log(this.rootEl);
    this.rootEl.html(feedView.render().$el)
  },

  index: function() {
    console.log("hey wtf");
    this.rootEl.html("");
  }
});