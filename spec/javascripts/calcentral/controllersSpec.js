describe('CalCentral controllers', function() {

  beforeEach(module('calcentral'));

  describe('Dashboard controller', function() {

    var rootScope;
    var ctrl;

    beforeEach(inject(function($rootScope, $controller) {
      rootScope = $rootScope.$new();

      ctrl = $controller('DashboardController', {
        $rootScope: rootScope
      });
    }));

    it("should have a defined dashboard controller", function() {
      expect(ctrl).toBeDefined();
    });

    it("should set the page title", function() {
      expect(rootScope.title).toBe('Dashboard | Calcentral');
    });

  });

});
