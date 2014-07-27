ShoeApp.Collections.ProjectFollowings = Backbone.Model.extend({
  model: ShoeApp.Models.ProjectFollowing,
  url: "api/project_followings/",

  initialize: function(models, options) {
    this.project = options.project;
  }
});
