(function(Collections) {

  Collections.Users = Backbone.Collection.extend({
    model: App.Models.User,
    url: 'api/users'
  });

})(App.Collections);