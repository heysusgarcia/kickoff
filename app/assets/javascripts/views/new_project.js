ShoeApp.Views.NewProject = Backbone.View.extend({
  template: JST['new_project'],

  className: 'container container-fluid',

  events: {
    "submit form" : "submit"
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  submit: function(event) {
    event.preventDefault();
    var $form = this.$el.find('#new-project');
    var formData = $form.serializeJSON();
    var that = this;
    var newProject = new ShoeApp.Models.Project(formData.project);
    newProject.save({}, { success: function () {
      that.collection.add(newProject);
      Backbone.history.navigate("#/projects/" + newProject.get("id"), {
        trigger: true
      });
      }
    });
  }
});
