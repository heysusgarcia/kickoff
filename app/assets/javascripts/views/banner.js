ShoeApp.Views.Banner = Backbone.View.extend({
  template: JST['banner'],

  className: 'banner full-width',

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  }
});
