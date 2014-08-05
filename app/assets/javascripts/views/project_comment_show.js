ShoeApp.Views.ProjectCommentShow = Backbone.View.extend({
  template: JST['project_show/project_comment_show'],

  tagName: 'li',
  className: 'backer-comment',

  initialize: function(options) {
    this.project = options.project;
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var backer = this.project.funders().findWhere({
      id: currentUserId
    });
    var renderedContent = this.template({
      comment: this.model,
      backer: backer
    });
    this.$el.html(renderedContent);
    return this;
  }

});
