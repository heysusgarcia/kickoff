ShoeApp.Collections.ProjectFunders = Backbone.Collection.extend({
  model: ShoeApp.Models.User,

  initialize: function(models, options) {
    this.project = options.project;
  }
});
