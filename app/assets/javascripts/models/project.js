ShoeApp.Models.Project = Backbone.Model.extend({
  urlRoot: "/api/projects",

  funders: function() {
    this._funders = this._funders ||
    new ShoeApp.Collections.ProjectFunders([], { project: this });
    return this._funders;
  },

  followers: function() {
    this._followers = this._followers ||
    new ShoeApp.Collections.ProjectFollowers([], { project: this });
    return this._followers;
  },

  updates: function() {
    this._updates = this._updates ||
    new ShoeApp.Collections.Updates([], { project: this });
    return this._updates;
  },

  comments: function() {
    this._comments = this._comments ||
    new ShoeApp.Collections.Comments([], { project: this });
    return this._comments;
  },

  parse: function(response) {
    if (response.followers) {
      this.followers().set(response.followers, { parse: true });
      delete response.followers;
    } else if (response.funders) {
      this.funders().set(response.funders, { parse: true });
      delete response.funders;
    } else if (response.updates) {
      this.updates().set(response.updates, { parse: true });
      delete response.updates;
    } else if (response.comments) {
      this.comments().set(response.comments, { parse: true });
      delete response.comments;
    }
    return response;
  },

  percent_funded: function() {
    var percent = 100 * (this.escape("amount_raised") / this.escape("funding_goal"));
    return String(percent) + "%";
  },

  currentUserIsAFunder: function () {
    var isFunder = this.funders().findWhere({id: currentUserId });
    if (isFunder) {
      return true;
    } else {
      return false;
    }
  },

  currentUserIsABacker: function() {
    var isBacker = this.funders().findWhere({id: currentUserId });
    if (isBacker) {
      return true;
    } else {
      return false;
    }
  }
});
