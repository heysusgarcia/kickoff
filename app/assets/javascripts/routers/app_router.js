ShoeApp.Routers.AppRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "" : "homepage",
    "profile/edit" : "editProfile",
    "profile" : "showProfile",
    "projects/new" : "newProject",
    "projects/:id/edit" : "editProject",
    "projects/:id" : "showProject"
  },

  homepage: function() {
    ShoeApp.projects.fetch();
    var homepageView = new ShoeApp.Views.Homepage({
      collection: ShoeApp.projects
    });
    this._swapView(homepageView);
  },

  editProfile: function() {
    var currUser = new ShoeApp.Models.User({id: currentUserId});
    currUser.fetch();
    var editProfileView = new ShoeApp.Views.EditProfile({
      model: currUser
    });
    this._swapView(editProfileView);
  },

  showProfile: function() {
    var currUser = new ShoeApp.Models.User({id: currentUserId});
    currUser.fetch();
    var profileView = new ShoeApp.Views.ProfileShow({
      model: currUser
    });
    this._swapView(profileView);
  },

  showProject: function(id) {
    var project = ShoeApp.projects.getOrFetch(id);
    var projectView = new ShoeApp.Views.ProjectShow({
      model: project
    });
    this._swapView(projectView);
  },

  newProject: function() {
    if (!signedIn) {
      document.location.href="/session/new";
    } else {
      var newProjectView = new ShoeApp.Views.NewProject({
        collection: ShoeApp.projects
      });
      this._swapView(newProjectView);
    }
  },

  // editProject: function(id) {
  //   var project = ShoeApp.projects.getOrFetch(id);
  //   if !(signedIn && (project.escape('founder_id') === currentUserId)) {
  //     Backbone.history.navigate("#/projects/" + id, { trigger: true });
  //   } else {
  //     var editProjectView = new ShoeApp.Views.EditProfile({
  //       model: project
  //     });
  //   }
  //   this._swapView(editProjectView);
  // }


  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
 });
