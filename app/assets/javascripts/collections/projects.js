ShoeApp.Collections.Projects = Backbone.Collection.extend({
  model: ShoeApp.Models.Project,
  url: "api/projects/",

  // initialize: function(models, options) {
  //   this.user = options.user;
  // },

  getOrFetch: function(id) {
    var project = ShoeApp.projects.get(id);
    if (project) {
      project.fetch();
    } else {
      project = new ShoeApp.Models.Project({ id: id });
      project.fetch({

        success: function () {
          ShoeApp.projects.add(project);
        }
      });
    }
    return project;
  },

  recent: function() {
    return new ShoeApp.Collections.Projects(this.slice(-8));
  }
});
