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

  updates: function() {
    this._updates = this._updates ||
    new ShoeApp.Collections.Updates([], { project: this });
    return this._updates;
  },

  comments: function()
    this._comments = this._comments ||
    new ShoeApp.Collections.Comments([], { project: this });
    return this._comments;
  },

  //
  // backings: function () {
  //   this._backings = this._backings ||
  //   new ShoeApp.Collections.ProjectFundings([], { project: this });
  //   return this._backings;
  // },
  //
  // followings: function () {
  //   this._followings = this._followings ||
  //   new ShoeApp.Collections.ProjectFollowings([], { project: this });
  //   return this._followings;
  // },

  parse: function(response) {
    if (response.followers) {
      this.followers().set(response.followers, { parse: true });
      delete response.followers;
    } else if (response.funders) {
      this.funders().set(response.funders, { parse: true });
      delete response.funders;
    } else if (response.updates) {
      this.updates().set(resposne.updates, { parse: true });
      delete response.updates;
    } else if (response.comments) {
      this.comments().set(response.comments, { parse: true });
      delete response.comments;
    }
    // } else if (response.backings){
    //   this.backings().set(response.backings, { parse: true });
    //   delete response.backings;
    // } else if (response.followings) {
    //   this.followings().set(response.followings, { parse: true });
    //   delete response.followings;
    // }
    return response;
  },

  percent_funded: function() {
    var percent = 100 * (this.escape("amount_raised") / this.escape("funding_goal"));
    return String(percent) + "%";
  },

  currentUserIsAFunder: function () {
    var isFunder = this.funders.findWhere({id: currentUser.id});
    if (isFunder) {
      return true;
    } else {
      return false;
    }
  },

  currentUserIsABacker: function() {
    var isBacker = this.backers.findWhere({id: current_user.id });
    if (isBacker) {
      return true;
    } else {
      return false;
    }
  }
});
