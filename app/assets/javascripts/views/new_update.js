ShoeApp.Views.NewUpdate = Backbone.View.extend({
  template: JST['project_show/new_update'],

  className: 'container container-fluid',
   
  events: {
    "submit form" : "submit"
  },

  render: function() {
    var renderedContent = this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    return this;
  },

  submit: function(event) {
    event.preventDefault();
    var $form = this.$el.find('#new-update-form');
    var formData = $form.serializeJSON();
    var that = this;
    var newUpdate = new ShoeApp.Models.Update(formData.update);
    newUpdate.save({}, { success: function() {
      that.model.updates().add(newUpdate);
      }
    });
  }
});
