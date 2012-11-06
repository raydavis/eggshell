(function() {
  /*global calcentral*/
  'use strict';

  /**
   * User controller
   */
  calcentral.controller('UserController', function UserController($http, $scope) {
    $http.get('dummy/user.json').success(function(data) {
      $scope.user = data;
    });

  });
})();
