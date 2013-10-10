(function(Models) {

  Models.User = Backbone.Model.extend({
    url: function() {
      if (this.id)
        return '/api/users/'+encodeURIComponent(this.id);
      else
        return '/api/user';
    },

    defaults: {
      first_name: null,
      last_name:  null,
      email:      null
    },

    initialize: function() {
    },

    validate: function(attrs) {
      if (!attrs.first_name)
        return "Cannot have an empty first name";

      if (!attrs.last_name)
        return "Cannot have an empty last name";

      if (!attrs.email)
        return "Cannot have an empty email";
    }
  });

})(App.Models);
