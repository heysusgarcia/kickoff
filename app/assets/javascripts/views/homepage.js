ShoeApp.Views.Homepage = Backbone.View.extend({
  template: JST['homepage'],

  initialize: function() {
  },

  className: 'container container-fluid',

  render: function () {
    var recentProjects = ShoeApp.projects.recent();
    renderedContent = this.template({
      projects: recentProjects
    });
    this.$el.html(renderedContent);
    return this;
  }
});
