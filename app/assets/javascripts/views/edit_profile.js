ShoeApp.Views.EditProfile = Backbone.View.extend({
  template: JST['edit_profile'],
  className: 'container',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    "submit form" : "submit",
    "change .image-input" : "handleFile"
  },

  render: function() {
    var renderedContent = this.template({
      user: this.model
    });
    this.$el.html(renderedContent);
    return this;
  },

  handleFile: function(event) {
    var file = event.currentTarget.files[0];
    var view = this;
    var reader = new FileReader();
    reader.onload = function(e) {
      view.model.set('profile_photo', this.result);
    }
    reader.readAsDataURL(file);
  },

  submit: function(event) {
    event.preventDefault();
    var $form = this.$el.find('#edit-user-profile')
  }
});
