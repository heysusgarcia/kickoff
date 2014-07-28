ShoeApp.Views.ProjectUpdates = Backbone.CompositeView.extend({
  template: JST['project_show/project_updates'],

  className: 'tab-pane fade',
  id: 'updates',

  initialize: function() {
    this.listenTo(this.model.updates(), 'add', this.addUpdate);

    var newUpdateView = new ShoeApp.Views.NewUpdate({
      model: this.model
    });
    this.addSubview('.new-update-form', newUpdateView);
    this.model.updates().each(this.addUpdate.bind(this));
  },

  addUpdate: function(update) {
    var updateShow = new ShoeApp.Views.ProjectUpdateShow({
      model: update
    });
    this.addSubview(".founder-update-body", updateShow);
  },

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.attachSubviews();
    return this;
  }
});
