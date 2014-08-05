ShoeApp.Views.FundingButton = Backbone.View.extend({
  template: function() {
    return this.open ?
    JST['project_show/funding_form']({
      project: this.model
    }):
    JST['project_show/funding_button']({
      project: this.model
    })
  },

  initialize: function() {
    this.open = false;
    this.listenTo(this.model, 'change', this.render);
  },

  events: {
    "click button.fund" : "beginFunding",
    "submit form" : "endFunding"
  },

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  beginFunding: function() {
    if (!signedIn) {
      document.location.href="/session/new";
    } else {
      this.open = true;
      this.render();
    }
  },

  endFunding: function(event) {
    event.preventDefault();
    this.open = false;

    var $form = this.$el.find('#funding-form');
    var amountFunded = parseInt($form.serializeJSON()['project_fund']['fund']);
    var params = $form.serializeJSON()['project_funding'];
    var view = this;
    var user = new ShoeApp.Models.User({id: currentUserId});
    user.fetch();
    var newProjectFunding = new ShoeApp.Models.ProjectFunding();
    var amountRaised = this.model.get('amount_raised') + amountFunded;
    this.model.set('amount_raised', amountRaised);
    debugger
    this.model.save({}, { success: function() {
      newProjectFunding.save(params);
      view.model.funders().add(user);
      }
    });
    this.render();
  } ///i don't feel okay with this, but i can't think of altenative for now.
});
