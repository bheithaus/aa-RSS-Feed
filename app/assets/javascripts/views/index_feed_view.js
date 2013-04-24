RSS.Views.FeedIndexView = Backbone.View.extend({
  events: {
    "click #add-feed" : "addFeed",
    "keypress #new-feed" : "submitFeed",
  },

  initialize: function() {
    var that = this;
    var respCallback = that.render.bind(that);

    that.collection.on('add', respCallback);
    that.collection.on('change', respCallback);
    that.collection.on('remove', respCallback);
  },

  render: function() {
    var that = this;
    var renderedContent = JST["feeds/index"]({
      feeds: that.collection
    });
    console.log(that.collection);
    that.$el.html(renderedContent);
    return that;
  },

  addFeed: function() {
    var that = this;

    $('#add-feed').replaceWith(
      $('<input id="new-feed" type="text" placeholder="Enter url here">')
    );
    $("#new-feed").focus();
    $("#new-feed").on('blur', function() {
      $("#new-feed").replaceWith(
        $('<p id="add-feed">Add New</p>')
      );
    });
  },

  submitFeed: function(e) {
    if (e.keyCode == 13) {
      var newFeedURL = $('#new-feed').val();
      var newFeed = new RSS.Models.Feed({
        url: newFeedURL
      });
      newFeed.save({url: newFeedURL}, {
        success: function(model, resp){
          RSS.Store.feeds.add(model);
          console.log("success");
          Backbone.history.navigate("#/feeds/" + model.id);
        },
        error: function(model, xhr){
          alert("how bout a real rss!");
        }
      })
    }
  }
});