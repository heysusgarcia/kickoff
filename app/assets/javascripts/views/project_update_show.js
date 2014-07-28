ShoeApp.Views.ProjectUpdateShow = Backbone.View.extend({
  template: JST['project_show/project_update_show'],

  tagName: 'li',
  className: 'founder_update',

  render: function() {
    var renderedContent = this.template({
      update: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
