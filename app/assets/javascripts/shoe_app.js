window.ShoeApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    ShoeApp.projects = new ShoeApp.Projects.Collections();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  ShoeApp.initialize();
});
