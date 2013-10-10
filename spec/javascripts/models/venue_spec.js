describe('Venue', function() {
  var venue;

  beforeEach(function() {
    venue = new App.Models.Venue();
    venue.set({name:'MetLife Stadium'});
    venue.set({description: 'The home of the Giants & Jets'});
    venue.set({lat:40.813611});
    venue.set({lng:-74.074444});
  });

  describe('initialize', function(){
    it('can be initialized', function() {
      expect(venue).toBeDefined();
    });
  });

  describe('attributes', function(){
    it('should have a name', function() {
      expect(venue.get('name')).toEqual('MetLife Stadium');
    });
    it('should have a description', function() {
      expect(venue.get('description')).toEqual('The home of the Giants & Jets');
    });

    describe('coordinates', function() {
      it('should have a latitude coordinate', function() {
        expect(venue.get('lat')).toEqual(40.813611);
      });
      it('should have a longitude coordinate', function() {
        expect(venue.get('lng')).toEqual(-74.074444);
      });

    });
  });
  describe('validate', function() {
    var validateSpy;
    beforeEach(function() {
      validateSpy = sinon.spy();
      venue.bind('invalid', validateSpy, this);
    });

    it('should not save if the name is empty', function() {
      venue.save({name:null});
      expect(validateSpy.calledOnce).toBeTruthy();
      expect(validateSpy.calledWith(venue,"Name is required")).toBeTruthy();
    });
  });
  describe('fetch', function() {
    var fixtures,
        server,
        venue,
        responseData;

    beforeEach(function(){
      fixtures = {
        valid: {
          'status':'OK',
          'version':'1.0',
          'response': {
            'venue': {
              'id':392,
              'name':'Soldier Field',
              'description':'The home of the Chicago Bears',
              'lat':40.813611,
              'lng':-74.074444
            }
          }
        }
      }; // end of fixtures obj

      server = sinon.fakeServer.create();
      venue = new App.Models.Venue();
      venue.set({id:392});
      venue.fetch();
      server.respondWith('GET',
                         '/api/venues/392',

                         JSON.stringify(fixtures.valid.response.venue)
                         );
      server.respond();
      responseData = JSON.parse(server.responses[0].response[2]);
    });

    afterEach(function() {
      server.restore();
    });

    it('should make the appropriate request', function() {
      expect(server.requests.length).toEqual(1);
      expect(server.requests[0].method).toEqual('GET');
      expect(server.requests[0].url).toEqual('/api/venues/392');
    });

    it('should respond with the appropriate data', function() {
      expect(venue.get('name'))       .toEqual(responseData.name);
      expect(venue.get('description')).toEqual(responseData.description);
      expect(venue.get('lat'))        .toEqual(responseData.lat);
      expect(venue.get('lng'))        .toEqual(responseData.lng);
    });
  });
});