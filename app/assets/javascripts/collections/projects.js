ShoeApp.Collections.Projects = Backbone.Collection.extend({
  model: ShoeApp.Models.Project,
  url: "api/projects/",

  getOrFetch: function(id) {
    var project = ShoeApp.projects.get(id);
    if (project) {
      project.fetch();
    } else {
      project = new ShoeApp.Models.Project({ id: id });
      project.save({
        success: function () {
          ShoeApp.projects.add(project);
        }
      });
    }
    return project;
  },

  recent: function() {
    return new ShoeApp.Collections.Projects(this.slice(-3));
  }
});