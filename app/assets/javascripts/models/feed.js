RSS.Models.Feed = Backbone.RelationalModel.extend ({
  urlRoot: "/feeds",

  relations: [{
    type: Backbone.HasMany,
    key: 'entries',
    relatedModel: 'RSS.Models.Entry',
    collectionType: 'RSS.Collections.FeedEntries',
    collectionOptions: function(feed) {
      return { feed: feed };
    },
    reverseRelation: {
      key: 'feed_id',
//      keySource: "feed_id",
      includeInJSON: 'id'
    }
  }]
});