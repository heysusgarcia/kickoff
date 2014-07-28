ShoeApp.Views.NewComment = Backbone.View.extend({
  template: JST['project_show/new_comment'],

  events: {
    "submit form" : "submit"
  },

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  submit: function(event) {
    event.preventDefault();
    var $form = this.$el.find('#new-comment-form');
    var formData = $form.serializeJSON();
    var that = this;
    var newComment = new ShoeApp.Models.Comment(formData.comment);
    newComment.save({}, { success: function() {
      that.model.comments().add(newComment);
      }
    });
  }
});
