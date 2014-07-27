ShoeApp.Models.Project = Backbone.Model.extend({
  urlRoot: "/api/projects",

  funders: function () {
    this._funders = this._funders ||
    new ShoeApp.Collections.ProjectFunders([], { project: this });
    return this._funders;
  },

  followers: function () {
    this._followers = this._followers ||
    new ShoeApp.Collections.ProjectFollowers([], { project: this });
    return this._followers;
  },

  backings: function () {
    this._backings = this._backings ||
    new ShoeApp.Collections.ProjectFundings([], { project: this });
    return this._backings;
  },

  followings: function () {
    this._followings = this._followings ||
    new ShoeApp.Collections.ProjectFollowings([], { project: this });
    return this._followings;
  },

  parse: function(response) {
    if (response.followers) {
      this.followers().set(response.followers, { parse: true });
      delete response.followers;
    } else if (response.funders) {
      this.funders().set(response.funders, { parse: true });
      delete response.funders;
    } else if (response.backings){
      this.backings().set(response.backings, { parse: true });
      delete response.backings;
    } else if (response.followings) {
      this.followings().set(response.followings, { parse: true });
      delete response.followings;
    }
    return response;
  },

  perecent_funded: function() {
    var percent = 100 * (this.escape("raised_amount") / this.escape("funding_goal"));
    return String(perecent) + "%";
  }
});
