ShoeApp.Collections.Comments = Backbone.Collection.extend({
  model: ShoeApp.Models.Comment,
  url: "/api/comments",

  initialize: function(models, options) {
    this.project = options.project
  }
});
