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
    "click a#comments" : "showComments",
    "click .nav-tabs a" : "toggleTabs"
  },

  render: function() {
    var renderedContent = this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    this.renderHomeByDefault();
    return this;
  },

  showUpdates: function(event){
    event.preventDefault();
    var updateView = new ShoeApp.Views.ProjectUpdates({
      model: this.model
    });
    this._swapContent(updateView);
  },

  showBackers: function(event) {
    event.preventDefault();


  },

  showComments: function(event) {
    event.preventDefault();


  },

  showHome: function(event) {
    event.preventDefault();


  },

  toggleTabs: function(event) {
    event.preventDefault();
    $(event.target).tab('show');
  },

  _swapContent: function(view) {
    if(this._currentView) {
      this._currentView.remove()
    }
    this._currentView = view;
    this.$('.tab-content').html(this._currentView.render().$el)
  }
});
