ShoeApp.Views.StaffPickCasual = Backbone.View.extend({
  template: JST['homepage/casual'],

  className: 'tab-pane fade active in',
  id: 'casual-design',

  render: function() {
    var renderedContent = this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
