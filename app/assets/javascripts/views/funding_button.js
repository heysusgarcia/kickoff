ShoeApp.Views.FundingButton = Backbone.View.extend({
  template: function() {
    return this.open ?
    JST['project_show/funding_form']():
    JST['project_show/funding_button']();
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
    if (currentUserId) {
      this.open = true;
      this.render();
    } else {
      document.location.href="/session/new";
    }
  },

  endFunding: function(event) {
    event.preventDefault();
    this.open = false;

    var $form = this.$el.find('#funding-form');
    var amountFunded = $form.serializeJSON();
    var view = this;
    var user = new ShoeApp.Models.User({id: currentUserId});
    user.fetch();
    var newProjectFunding = new ShoeApp.Models.ProjectFunding();
    var amountRaised = this.model.get('amount_raised') + amountFunded;
    this.model.set('amount_raised', amountRaised);
    this.model.save({}, { success: function() {
      newProjectFunding.save();
      view.model.funders().add(user);
      }
    });
    this.render();
  } ///i don't feel okay with this, but i can't think of altenative for now.
});
