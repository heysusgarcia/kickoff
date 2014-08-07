ShoeApp.Views.Homepage = Backbone.View.extend({
  template: JST['homepage'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  className: 'container full-width homepage-view',

  events: {
    "click a#fashion-design" : "showFashionPick",
    "click a#casual-design" : "showCasualPick",
    "click a#basketball-design" : "showBasketballPick",
    "click a#skateboarding-design" : "showSkateboardingPick",
    "click a#baseball-design" : "showBaseballPick",
    "click a#football-design" : "showFootballPick",
    "click .staff-picks-nav a" : "toggleTabs"
  },

  render: function () {
    var recentProjects = this.collection.recent();
    renderedContent = this.template({
      projects: recentProjects
    });
    this.$el.html(renderedContent);
    var banner = new ShoeApp.Views.Banner();
    // this.showCasualPick();
    this.$('.banner-view').html(banner.render().$el);
    return this;
  },

  showFashionPick: function() {
    var fashionProject = ShoeApp.projects.get(1);
    var fashionPickView = new ShoeApp.Views.StaffPickFashion({
      model: fashionProject
    });
    this._swapContent(fashionPickView);
  },

  showCasualPick: function() {
    var casualProject = ShoeApp.projects.get(2);
    var casualPickView = new ShoeApp.Views.StaffPickCasual({
      model: casualProject
    });
    this._swapContent(casualPickView);
  },

  showBasketballPick: function() {
    var basketballProject = ShoeApp.projects.get(3);
    var basketballPickView = new ShoeApp.Views.StaffPickCasual({
      model: basketballProject
    });
    this._swapContent(basketballPickView);
  },

  showSkateboardingPick: function() {
    var skateboardingProject = ShoeApp.projects.get(4);
    var skateboardingPickView = new ShoeApp.Views.StaffPickCasual({
      model: skateboardingProject
    });
    this._swapContent(skateboardingPickView);
  },

  showBaseballPick: function() {
    var baseballProject = ShoeApp.projects.get(5);
    var baseballPickView = new ShoeApp.Views.StaffPickCasual({
      model: baseballProject
    });
    this._swapContent(baseballPickView);
  },

  showFootballPick: function() {
    var footballProject = ShoeApp.projects.get(6);
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
