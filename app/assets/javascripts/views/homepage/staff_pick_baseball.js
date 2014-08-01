ShoeApp.Views.StaffPickBaseball = Backbone.View.extend({
  template: JST['homepage/baseball'],

  className: 'tab-pane fade active in',
  id: 'baseball-design',

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
