ShoeApp.Routers.AppRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "" : "homepage"
  },

  homepage: function () {
    var homepage = new ShoeApp.Views.Homepage({});
    this._swapView(homepage);
  },


  _swapView: function(view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(this.currentView.render().$el);
  }
 });
