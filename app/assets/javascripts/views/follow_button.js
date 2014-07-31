ShoeApp.Views.FollowButton = Backbone.View.extend({
  template: JST['follow_button'],

  events: {
    "submit form" : "followProject"
  },

  render: function() {
    var renderedContent = this.template({
      project: this.model
    });
  },

  followProject: function(event) {
    event.preventDefault();
    var $form = this.$el.find('#follow-form');
    var params = $form.serializeJSON()['project_following'];
    var view = this;
    var user = new ShoeApp.Models.User({id: currentUserId});
    user.fetch();
    var projectFollowing = new ShoeApp.Models.ProjectFollowing({
      params
    });
    this.projectFollowing.save({}, { success: function() {
      view.model.followers().add(user);
      user.followedProjects().add(view.model);
    }
    })

  }
});
