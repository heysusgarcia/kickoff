ShoeApp.Collections.Updates = Backbone.Collection.extend({
  model: ShoeApp.Models.Update,
  url: "/api/updates",

  initialize: function(models, options) {
    this.project = options.project;
  }
});
