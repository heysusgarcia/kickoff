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
    var homepageView = new ShoeApp.Views.Homepage();
    this._swapView(homepageView);
  },

  showProject: function(id) {
    var project = ShoeApp.projects.getOrFetch(id);


  },

  newProject: function() {
    var project = new ShoeApp.Models.Project();
    var newProjectView = new ShoeApp.Views.NewProject({
      model: project
    });

    this._swapView(newProjectView);
  },


  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
 });
