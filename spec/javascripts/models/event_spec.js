describe("Event", function() {
  var event;
  beforeEach(function() {
    event = new App.Models.Event();
  });
  describe('initialize', function() {
    it('can be initialized', function() {
      expect(event).toBeDefined();
    });
  });
});