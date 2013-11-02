describe("User", function() {
  var user;
  beforeEach(function() {
    user = new App.Models.User();
    user.set({first_name:'Brian'});
    user.set({last_name:'Yingling'});
    user.set({email:'byingling@gmail.com'});

  });

  it('can be instantiated', function() {
    expect(user).toBeDefined();
  });

  it('should exhibit attributes', function() {
    expect(user.get('first_name')).toEqual('Brian');
    expect(user.get('last_name')) .toEqual('Yingling');
    expect(user.get('email'))     .toEqual('byingling@gmail.com');
  });

  describe('validations', function() {
    var errorSpy;
    beforeEach(function() {
      errorSpy = sinon.spy();
      user.bind('invalid', errorSpy, this);
    });
    it('should not save when first name is null', function() {
      user.save({first_name:null});
      expect(errorSpy.calledOnce).toBeTruthy();
      expect(errorSpy.calledWith(user,"Cannot have an empty first name")).toBeTruthy();
    });
    it('should not save when the last name is null', function() {
      user.save({last_name:null});
      expect(errorSpy.calledOnce).toBeTruthy();
      expect(errorSpy.calledWith(user, "Cannot have an empty last name")).toBeTruthy();
    });
    it('should not save when the email field is null', function() {
      user.save({email:null});
      expect(errorSpy.calledOnce).toBeTruthy();
      expect(errorSpy.calledWith(user, "Cannot have an empty email")).toBeTruthy();
    });
  });

});



