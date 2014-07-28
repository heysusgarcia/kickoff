ShoeApp.Views.Homepage = Backbone.View.extend({
  template: JST['homepage'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var recentProjects = this.collection.recent();
    renderedContent = this.template({
      projects: recentProjects
    });
    this.$el.html(renderedContent);
    return this;
  }
});
