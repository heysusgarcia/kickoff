ShoeApp.Views.StaffPickFootball = Backbone.View.extend({
  template: JST['homepage/football'],

  className: 'tab-pane fade',
  id: 'football-design',

  render: function() {
    var renderedContent = this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }


});
