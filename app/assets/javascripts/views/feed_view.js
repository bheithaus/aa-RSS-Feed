RSS.Views.FeedView = Backbone.View.extend({
  events: {
    "click button#delete" : "delete",
  },

  render: function() {
    var that = this;
    var renderedContent;

    that.model.get("entries").fetch({
      success: function() {
        renderedContent = JST["feeds/show"]({
            feed: that.model
        });

        that.$el.html(renderedContent);
      }
    });

    return that;
  },

  delete: function() {
    var that = this;
    if(confirm("Are you sure?")) {
      that.model.destroy({
        success: function(model, response) {
          Backbone.history.navigate("",{trigger: true});
          alert("Feed "+model.escape("title")+" has been deleted!");
        },
        error: function(model, xhr, options) {
          alert("You suck! We couldn't delete feed " + model.escape("title"))
        }
      });
    }
  }
});