ShoeApp.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",

  backedProjects: function() {
    this._backedProjects = this._backedProjects ||
    new ShoeApp.Collections.Projects([], { user: this });
    return this._backedProjects;
  },

  followedProjects: function() {
    this._followedProjects = this._followedProjects ||
    new ShoeApp.Collections.Projects([], { user: this });
    return this._followedProjects;
  },

  startedProjects: function() {
    this._startedProjects = this._startedProjects ||
    new ShoeApp.Collections.Projects([], { user: this });
    return this._startedProjects;
  },

  parse: function(response) {
    if (response.started_projects) {
      this.startedProjects().set(response.started_projects, { parse: true });
      delete response.started_projects;
    } else if (response.followed_projects) {
      this.followedProjects().set(response.followed_projects, { parse: true });
      delete response.followed_projects;
    } else if (response.backed_projects) {
      this.backedProjects().set(response.backed_projects, { parse: true });
      delete response.backed_projects;
    }
    return response;
  }
});
