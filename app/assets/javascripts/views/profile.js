ShoeApp.Views.ProfileShow = Backbone.View.extend({
  template: JST['profile'],

  className: 'container profile-show',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    "click .nav-tabs a" : "toggleTabs"
  },

  render: function() {
    var renderedContent = this.template({
      startedProjects: this.model.startedProjects(),
      backedProjects: this.model.backedProjects(),
      followedProjects: this.model.followedProjects()
    });
    this.$el.html(renderedContent);
    return this;
  },

  toggleTabs: function (event) {
    event.preventDefault();
    $(event.target).tab('show');
  }
});
