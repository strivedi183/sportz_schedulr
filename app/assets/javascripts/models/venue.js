(function(Models) {

  Models.Venue = Backbone.Model.extend({
    url: function() {
      if (this.id)
        return "/api/venues/"+encodeURIComponent(this.id);
      else
        return "/api/venue";
    },

    defaults: {
      name:         null,
      description:  null,
      lat:          null,
      lng:          null
    },

    initialize: function() {
      console.log('Venue model has been instantiated');
    },

    validate: function(attrs) {
      if (!attrs.name)
        return "Name is required";
    },

    parse: function(res) {
      this.set('name', res.name);
      this.set('description', res.description);
      this.set('lat', res.lat);
      this.set('lng', res.lng);
    }

  });

}) (App.Models);