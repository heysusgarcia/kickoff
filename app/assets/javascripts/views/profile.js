ShoeApp.Views.ProfileShow = Backbone.View.extend({
  template: JST['profile'],

  className: 'container profile-show',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var renderedContent = this.template({
      startedProjects: this.model.startedProjects,
      backedProjects: this.model.backedProjects,
      followedProjects: this.model.followedProjecs
    });
    this.$el.html(renderedContent);
    return this;
  }

});
