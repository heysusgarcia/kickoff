ShoeApp.Views.ProjectShow = Backbone.View.extend({
  template: JST['project_show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    renderedContent: this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    return this;
  },
});
