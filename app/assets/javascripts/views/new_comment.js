Backbone.Views.NewComment = Backbone.View.extend({
  template: JST['project_show/new_comment'],

  events: {
    "submit form" : "submit"
  },

  render: funtion() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  submit: function(event) {
    event.preventDefault();
    var $form = this.$el.find('#new-comment-form')
  }
});
