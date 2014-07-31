ShoeApp.Views.EditProject = Backbone.View.extend({
  template: JST['edit_project'],

  className: 'container container-fluid',

  events: {
    "submit form" : "submit",
    "change .image-input" : "handleFile"
  },

  render: function() {
    var renderedContent = this.template({
      project: this.model
    });
    this.$el.html(renderedContent);
    return this;
  },

  handleFile: function(event) {
    var file = event.currentTarget.files[0];
    var view = this;
    var reader = new FileReader();
    reader.onload = function(e) {
      view.$('#put-photo-here').vale(this.result);
      $('#project-photo').attr('src', e.target);
    }
    reader.readAsDataURL(file);
  },

  submit: function(event) {
    event.preventDefault();
    var $form = this.$el.find('#edit-project');
    var formData = $form.serializeJSON()['project'];
    var view = this;
    this.model.set(formData);
    this.model.save({}, { success: function() {
      Backbone.history.navigate("#/projects/" + this.model.get("id"), {
        trigger: true
        });
      }
    });
  }
});
