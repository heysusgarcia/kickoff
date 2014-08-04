ShoeApp.Views.Homepage = Backbone.View.extend({
  template: JST['homepage'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  className: 'container full-width',
  //
  // events: {
  //   "click a#fashion-design" : "showFashionPick",
  //   "click a#casual-design" : "showCasualPick",
  //   "click a#basketball-design" : "showBasketballPick",
  //   "click a#skateboarding-design" : "showSkateboardingPick",
  //   "click a#baseball-design" : "showBaseballPick",
  //   "click a#football-design" : "showFootballPick",
  // },

  render: function () {
    var recentProjects = this.collection.recent();
    renderedContent = this.template({
      projects: recentProjects
    });
    this.$el.html(renderedContent);
    // this.showCasualPick();
    return this;
  },

  showFashionPick: function() {
    var fashionProject = ShoeApp.projects.getOrFetch();
    var fashionPickView = new ShoeApp.Views.StaffPickFashion({
      model: fashionProject
    });
    this._swapContent(fashionPickView);
  },

  showCasualPick: function() {
    var casualProject = ShoeApp.projects.getOrFetch();
    var casualPickView = new ShoeApp.Views.StaffPickCasual({
      model: casualProject
    });
    this._swapContent(casualPickView);
  },

  showBasketballPick: function() {
    var basketballProject = ShoeApp.projects.getOrFetch();
    var basketballPickView = new ShoeApp.Views.StaffPickCasual({
      model: basketballProject
    });
    this._swapContent(basketballPickView);
  },

  showSkateboardingPick: function() {
    var skateboardingProject = ShoeApp.projects.getOrFetch();
    var skateboardingPickView = new ShoeApp.Views.StaffPickCasual({
      model: skateboardingProject
    });
    this._swapContent(skateboardingPickView);
  },

  showBaseballPick: function() {
    var baseballProject = ShoeApp.projects.getOrFetch();
    var baseballPickView = new ShoeApp.Views.StaffPickCasual({
      model: baseballProject
    });
    this._swapContent(baseballPickView);
  },

  showFootballPick: function() {
    var footballProject = ShoeApp.projects.getOrFetch();
    var footballPickView = new ShoeApp.Views.StaffPickCasual({
      model: footballProject
    });
    this._swapContent(footballPickView);
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
    this.$('.staff-picks').html(this._currentView.render().$el)
  }
});
