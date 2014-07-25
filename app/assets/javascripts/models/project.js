ShoeApp.Models.Project = Backbone.Model.extend({
  urlRoot: "/api/projects",

  funders: function () {
    this._funders = this._funders || new ShoeApp.Collections.ProjectFunders([],
    { project: this });
    return this._funders;
  },

  followers: function () {
    this._followers = this._followers ||
    new ShoeApp.Collections.ProjectFollowers([], { project: this });
    return this._followers;
  },

  parse: function(response) {
    if (response.followers) {
      this.followers().set(response.followers, { parse: true });
      delete response.followers;
    } else if (response.funders) {
      this.funders().set(response.funders, { parse: true });
      delete response.funders;
    }
    return response;
  },

  perecent_funded: function() {
    var percent = 100 * (this.escape("raised_amount") / this.escape("funding_goal"));
    return String(perecent) + "%";
  }
});
