ShoeApp.Views.ProjectComments = Backbone.CompositeView.extend({
  template: JST['project_show/project_comments'],

  className: 'tab-pane fade',
  id: 'comments',

  initialize: function() {
    this.listenTo(this.model.comments(), 'add', this.addComment);

    var newCommentView = new ShoeApp.Views.NewComment({
      model: this.model
    });
    this.addSubview('.new-comment-form', newCommentView);
    this.model.comments().each(this.addComment.bind(this));
  },

  addComment: function(comment) {
    var commentShow = new ShoeApp.Views.ProjectCommentShow({
      model: comment
    });
    this.addSubview(".backers-comments", commentShow);
  },

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.attachSubviews();
    return this;
  }
});
