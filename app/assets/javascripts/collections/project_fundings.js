ShoeApp.Collections.ProjectFundings = Backbone.Collection.extend({
  model: ShoeApp.Models.ProjectFunding,

  url: "api/project_fundings/",

  initialize: function(models, options) {
    this.project = options.project;
  }
});
