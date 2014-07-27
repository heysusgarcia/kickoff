ShoeApp.Collections.ProjectFollowers = Backbone.Collection.extend({
  model: ShoeApp.Models.User,

  initialize: function(models, options) {
    this.project = options.project;
  },

  url: function() {
    return this.project.url() + "/followers";
  }
});
