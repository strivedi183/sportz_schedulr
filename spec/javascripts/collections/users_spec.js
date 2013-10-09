describe("Users", function() {
  var users;
  beforeEach(function() {
    users = new App.Collections.Users();
  });
  it('can be instantiated', function() {
    expect(users).toBeDefined();
  });
});