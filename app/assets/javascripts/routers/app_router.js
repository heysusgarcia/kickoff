ShoeApp.Routers.AppRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "" : "homepage",
    "projects/new" : "newProject",
    "projects/:id" : "showProject"

  },

  homepage: function () {
    ShoeApp.projects.fetch();
    var homepageView = new ShoeApp.Views.Homepage({
      collection: ShoeApp.projects
    });
    this._swapView(homepageView);
  },

  showProject: function(id) {
    var project = ShoeApp.projects.getOrFetch(id);
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


  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
 });
