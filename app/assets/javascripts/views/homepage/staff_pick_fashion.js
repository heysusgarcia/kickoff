ShoeApp.Views.StaffPickFashion = Backbone.View.extend({
  template: JST['homepage/fashion'],

  className: 'tab-pane fade active in',
  id: 'fashion-design',

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
