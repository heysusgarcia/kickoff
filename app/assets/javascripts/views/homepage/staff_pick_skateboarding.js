ShoeApp.Views.StaffPickSkateboarding = Backbone.View.extend({
  template: JST['homepage/skateboarding'],

  className: 'tab-pane fade',
  id: 'skateboarding-design',

  render: function() {
    var renderedContent = this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
