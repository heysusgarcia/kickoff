ShoeApp.Views.ProjectFunders = Backbone.View.extend({
  template: JST['project_show/project_funders'],

  className: 'tab-pane fade',
  tagName: 'ul',
  id: 'backers',

  initialize: function() {
    this.listenTo(this.model.funders(), 'sync', this.render);
  },

  render: function() {
    var renderedContent = this.template({
      backers: this.model.funders()
    });
    this.$el.html(renderedContent);
    return this;
  }
});
