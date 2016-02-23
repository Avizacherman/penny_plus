angular.module('LocationModule')
  .factory('$geoUpdate', ["$http", "$log", "$geodatumApi", function($http, $log, $geodatumApi){
    return { updateLocation: function(){
      navigator.geolocation.getCurrentPosition(pos => {
        if(pos) {  
          $geodatumApi.updateGeoApi(pos.coords.latitude, pos.coords.longitude)
        }
      })
    }
  }
}])
