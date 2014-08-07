ShoeApp.Views.StaffPickFashion = Backbone.View.extend({
  template: JST['homepage/fashion'],

  className: 'tab-pane fade active in',
  id: 'fashion-design',

  render: function() {
    var renderedContent = this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
