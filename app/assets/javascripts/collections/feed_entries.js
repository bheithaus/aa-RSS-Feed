RSS.Collections.FeedEntries = Backbone.Collection.extend({
  url: function() {
    return "/feeds/" + this.feed.id + "/entries";
  },

  initialize: function(model, options) {
    this.feed = options.feed;
  }
});