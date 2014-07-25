ShoeApp.Views.ProjectShow = Backbone.View.extend({
  template: JST['project_show'],

  className: "container-fluid"

  render: function() {
    renderedContent: this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
