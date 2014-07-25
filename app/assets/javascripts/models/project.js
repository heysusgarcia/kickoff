ShoeApp.Models.Project = Backbone.Model.extend({
  urlRoot: "/api/projects",

  perecent_funded: function() {
    var percent = 100 * (this.escape("raised_amount") / this.escape("funding_goal"));
    return String(perecent) + "%";
  }
});
