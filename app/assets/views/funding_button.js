ShoeApp.Views.FundingButton = Backbone.View.extend({
  template: function() {
    return this.open ? JST['funding_form'] : JST['funding_button'];
  }

  tagName: 'button',

  initialize: function() {
    this.open = falsel;
    this.listenTo(this.model, 'change', this.render);
  },

  events: {
    "click button.fund" : "beginFunding",
    "submit form" : "endFunding"
  },

  render: function() {
    var renderedContent = this.template();
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
    var that = this;

    var newProjectFunding = new ShoeApp.Models.ProjectFunding();
    var amountRaised = this.model.get('amount_raised') + amountFunded;
    this.model.set({'amount_raised', amountRaised});
    this.model.save({}, { success: function() {
      newProjectFunding.save();
      }
    });
    this.render();
  }
});
