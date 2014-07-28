ShoeApp.Views.ProjectCommentShow = Backbone.View.extend({
  template: JST['project_show/project_comment_show'],

  tagName: 'li',
  className: 'backer-comment',

  render: function() {
    var renderedContent = this.template({
      comment: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }

});
