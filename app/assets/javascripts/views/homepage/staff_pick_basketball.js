ShoeApp.Views.StaffPickBasketball = Backbone.View.extend({
  template: JST['homepage/basketball'],

  className: 'tab-pane fade',
  id: 'basketball-design',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var renderedContent = this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
