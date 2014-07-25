ShoeApp.Views.ProjectShow = Backbone.View.extend({
  template: JST['project_show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this._homeView = new HomeView();
    this._commentView = new CommentView();
    this._currentView = this._homeView;
  },

  className: 'container container-fluid',

  events: {
    "click a#home" : "showHome",
    "click a#updates" : "showUpdates",
    "click a#backers" : "showBackers",
    "click a#comments" : "showComments"
  },

  render: function() {
    renderedContent: this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    this.$('.project-views').html(this._currentView.$el);
    return this;
  },

  showUpdates: function(event){
    event.preventDefual();
    this._currentView = this._updatesView;
    this.render();
  },

  // remove: override the remove method, call remove on the subview
  // and the entire/big/parent view.




});
