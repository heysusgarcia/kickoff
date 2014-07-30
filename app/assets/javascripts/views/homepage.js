ShoeApp.Views.Homepage = Backbone.View.extend({
  template: JST['homepage'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  className: 'container',

  render: function () {
    var recentProjects = this.collection.recent();
    renderedContent = this.template({
      projects: recentProjects
    });
    var bannerView = new ShoeApp.Views.Banner();
    this.$el.html(renderedContent);
    this.$el.prepend(bannerView);
    return this;
  }
});
