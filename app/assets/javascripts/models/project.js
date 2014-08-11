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
    }

    if (response.funders) {
      this.funders().set(response.funders, { parse: true });
      delete response.funders;
    }

    if (response.updates) {
      this.updates().set(response.updates, { parse: true });
      delete response.updates;
    }

    if (response.comments) {
      this.comments().set(response.comments, { parse: true });
      delete response.comments;
    }

    return response;
  },

  percentFunded: function() {
    var percent = 100 * (Math.round(this.escape("amount_raised") / this.escape("funding_goal")));
    return String(Math.round(percent)) + "%";
  },

  currentUserIsAFunder: function () {
    if (signedIn) {
      var isFunder = this.funders().findWhere({id: currentUserId });
      if (isFunder) {
        return true;
      } else {
        return false;
      }
    }
  },

  currentUserIsABacker: function() {
    if (signedIn) {
      var isBacker = this.funders().findWhere({id: currentUserId });
      if (isBacker) {
        return true;
      } else {
        return false;
      }
    }
  },

  currentUserIsAFollower: function() {
    if (signedIn) {
      var isFollower = this.followers().findWhere({id: currentUserId });
      if (isFollower) {
        return true;
      } else {
        return false;
      }
    }
  },

  daysLeft: function() {
    var createDate = new Date(this.escape('created_at'));
    var startDate = createDate.getDate();
    var startYear = createDate.getFullYear();
    var startMonth = createDate.getMonth();
    var a = moment([startYear, startMonth, startDate]);

    var dateNow = new Date();
    var currDate = dateNow.getDate();
    var currYear = dateNow.getFullYear();
    var currMonth = dateNow.getMonth();
    var b = moment([currYear, currMonth, currDate]);
    var daysSince = b.diff(a, 'days');

    if ( daysSince < this.escape('duration')) {
      return this.escape('duration') - daysSince;
    } else {
      return 0;
    }
  }
});
