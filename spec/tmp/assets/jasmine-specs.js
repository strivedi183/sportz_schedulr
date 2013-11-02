describe('Foo', function() {
  it('does something', function() {
    expect(1+1).toBe(2);
  });
});
describe("User", function() {
  it('can be instantiated', function() {
    debugger;
    var user = new App.Models.User();
    expect(user).toBeDefined();
  });
});

