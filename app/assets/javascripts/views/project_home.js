ShoeApp.Views.ProjectHome = Backbone.View.extend({
  template: JST['project_show/project_home'],

  className: 'tab-pane fade active in',
  id: "home",

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var renderedContent = this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    debugger
    return this;
  }
});
