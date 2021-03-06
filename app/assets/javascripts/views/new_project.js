ShoeApp.Views.NewProject = Backbone.View.extend({
  template: JST['new_project'],

  className: 'container container-fluid',

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  events: {
    "submit form" : "submit",
    "change .image-input" : "handleFile"
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  handleFile: function(event) {
    var file = event.currentTarget.files[0];
    var view = this;
    var reader = new FileReader();
    reader.onload = function(e) {
      view.$('#put-photo-here').val(this.result);
      $('#project-photo').attr('src', e.target.result);
    }
    reader.readAsDataURL(file);
  },

  previewFile: function previe() {
    var preview = document.querySelector('img');
    var file    = document.querySelector('input[type=file]').files[0];
    var reader  = new FileReader();

    reader.onloadend = function () {
      preview.src = reader.result;
    }

    if (file) {
      reader.readAsDataURL(file);
    } else {
      preview.src = "";
    }
  },

  submit: function(event) {
    event.preventDefault();
    var $form = this.$el.find('#new-project');
    var formData = $form.serializeJSON()['project'];
    var view = this;
    debugger
    var newProject = new ShoeApp.Models.Project(formData);
    newProject.save({}, {
      success: function() {
        view.collection.add(newProject);
        Backbone.history.navigate("#/projects/" + newProject.get("id"), {
          trigger: true
          });
        }
    });
  }
});
