ShoeApp.Views.Banner = Backbone.View.extend({
  template: JST['banner'],

  className: 'container container-fluid',

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  }
});
