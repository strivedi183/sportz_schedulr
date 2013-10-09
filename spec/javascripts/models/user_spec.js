describe("User", function() {
  var user;
  beforeEach(function() {
    user = new App.Models.User();
  });
  it('can be instantiated', function() {
    expect(user).toBeDefined();
  });
});
