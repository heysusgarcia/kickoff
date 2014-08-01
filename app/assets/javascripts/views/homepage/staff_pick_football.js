ShoeApp.Views.StaffPickFootball = Backbone.View.extend({
  template: JST['homepage/football'],

  className: 'tab-pane fade active in',
  id: 'football-design',

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
