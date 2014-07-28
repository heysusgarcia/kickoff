ShoeApp.Views.ProjectShow = Backbone.View.extend({
  template: JST['project_show/project_show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this._homeView = new ShoeApp.Views.ProjectHome({
      model: this.model
    });
    this._commentsView = new ShoeApp.Views.ProjectComments({
      model: this.model
    });
    this._updatesView = new ShoeApp.Views.ProjectUpdates({
      model: this.model
    });
    this._backersView = new ShoeApp.Views.ProjectFunders({
      model: this.model
    });
    this._currentView = this._homeView;
  },

  className: 'project-show-info',

  events: {
    "click a#home" : "showHome",
    "click a#updates" : "showUpdates",
    "click a#backers" : "showBackers",
    "click a#comments" : "showComments"
  },

  render: function() {
    var renderedContent = this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    this.$('.tab-content').html(this._currentView.$el);
    return this;
  },

  showUpdates: function(event){
    event.preventDefault();
    this._currentView = this._updatesView;
    this.render();
  },

  showBackers: function(event) {
    event.preventDefault();
    this._currentView = this._backersView;
    this.render();
  },

  showComments: function(event) {
    event.preventDefault();
    this._currentView = this._backersView;
    this.render();
  },

  showHome: function(event) {
    event.preventDefault();
    this._currentView = this._homeView;
    this.render();
  }
  //
  // remove: function() {
  //   this._currentView && this._currentView.remove() && this.remove();
  // }

  // remove: override the remove method, call remove on the subview
  // and the entire/big/parent view.
});
