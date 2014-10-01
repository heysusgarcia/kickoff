ShoeApp.Views.ProjectShow = Backbone.View.extend({
  template: JST['project_show/project_show'],

  initialize: function () {
    this.listenTo(this.model, 'sync change', this.render);
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
    this.showHome();
    var fundingView = new ShoeApp.Views.FundingButton({
      model: this.model
    });
    this.$('#funding-view').html(fundingView.render().$el);
    return this;
  },

  showUpdates: function(event){
    var updateView = new ShoeApp.Views.ProjectUpdates({
      model: this.model
    });
    this._swapContent(updateView);
  },

  showBackers: function(event) {
    var backersView = new ShoeApp.Views.ProjectFunders({
      model: this.model
    });
    this._swapContent(backersView);
  },

  showComments: function(event) {
    var commentsView = new ShoeApp.Views.ProjectComments({
      model: this.model
    });
    this._swapContent(commentsView);
  },

  showHome: function(event) {
    var homeView = new ShoeApp.Views.ProjectHome({
      model: this.model
    });
    this._swapContent(homeView);
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
