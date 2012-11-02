/**
 * User controller
 */
function UserController($http, $scope) {

  'use strict';

  $http.get('dummy/user.json').success(function(data) {
    $scope.user = data;
  });

}

//UserController.$inject = ['$scope', '$http'];
