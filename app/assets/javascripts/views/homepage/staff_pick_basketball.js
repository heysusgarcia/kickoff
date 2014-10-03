ShoeApp.Views.StaffPickBasketball = Backbone.View.extend({
  template: JST['homepage/basketball'],

  className: 'tab-pane fade',
  id: 'basketball-design',

  render: function() {
    var renderedContent = this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
