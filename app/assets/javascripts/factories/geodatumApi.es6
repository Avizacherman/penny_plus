angular.module('LocationModule')
  .factory('$geodatumApi', ["$http", "$log", function($http, $log){
    return {
      updateGeoApi: function(lat, lng){
        return $http.put('/api/geodatum/x', {lat, lng})
      }
    }
}])
