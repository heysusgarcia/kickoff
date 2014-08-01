ShoeApp.Views.StaffPickSkateboarding = Backbone.View.extend({
  template: JST['homepage/skateboarding'],

  className: 'tab-pane fade active in',
  id: 'skateboarding-design',

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
