ShoeApp.Views.NewProject = Backbone.View.extend({
  template: JST['new_project'],

  render: function () {
    var renderedContent = this.template();
  }
});
