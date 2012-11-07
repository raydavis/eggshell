(function() {
  /*global calcentral*/
  'use strict';

  /**
   * User controller
   */
  calcentral.controller('UserController', ['$http', '$scope', function($http, $scope) {

    $http.get('dummy/user.json').success(function(data) {
      $scope.user = data;
    });

  }]);

})();
