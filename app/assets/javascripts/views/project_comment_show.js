ShoeApp.Views.ProjectCommentShow = Backbone.View.extend({
  template: JST['project_show/project_comment_show'],

  tagName: 'li',
  className: 'backer-comment',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var backer = this.model.backers.findWhere({
      id: current_user.id
    });
    var renderedContent = this.template({
      comment: this.model,
      backer: backer
    });
    this.$el.html(renderedContent);
    return this;
  }

});
