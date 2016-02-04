angular.module('MainModule')
  .factory('geoUpdate', ["$q", function($q){
    return { getLocation: function(){
      return $q((resolve, reject) => {
      navigator.geolocation.getCurrentPosition(pos => {
        if(pos) { resolve(pos) }
        else reject()
      })
    })
  }
}


   }])
