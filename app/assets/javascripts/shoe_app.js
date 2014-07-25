window.ShoeApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    ShoeApp.projects = new ShoeApp.Collections.Projects();
    new ShoeApp.Routers.AppRouter({
      $rootEl: $('#main')
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  ShoeApp.initialize();
});
