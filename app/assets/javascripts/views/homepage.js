ShoeApp.Views.Homepage = Backbone.CompositeView.extend({
  template: JST['homepage'],

  initialize: function() {
    this.listenTo(this.model.lists(), 'sync', this.render);
    this.listenTo(this.model.lists(), 'add', this.render);
  },

  render: function () {
    var recentProjects = ShoeApp.projects.recent();
    renderedContent = this.template({
      recent: recentProjects //add more projs later
    });
    this.$el.html(renderedContent);

    this.$el.find('.recent-projects').html()
  }
});
