(function(Models) {

  Models.Event = Backbone.Model.extend({
    defaults: {
      name:         null,
      description:  null,
      lat:          null,
      lng:          null,
      date:         null
     },
  });

})(App.Models);