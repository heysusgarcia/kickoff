ShoeApp.Views.ProjectComments = Backbone.CompositeView.extend({
  template: JST['project_show/project_comments'],

  className: 'tab-pane fade active in',
  id: "comments",

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.comments(), 'add', this.addComment);

    var newCommentView = new ShoeApp.Views.NewComment({
      model: this.model
    });
    this.prependSubview('.new-comment-form', newCommentView);
    this.model.comments().each(this.addComment.bind(this));
  },

  addComment: function(comment) {
    var commentShow = new ShoeApp.Views.ProjectCommentShow({
      model: comment,
      project: this.model
    });
    this.addSubviewReverse(".backers-comments", commentShow);
  },

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.prependSubviews();
    return this;
  }
});
