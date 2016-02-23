angular.module("LocationModule", [])



angular.module("LocationModule").controller("LocationController", ["$scope", "$interval", "$geoUpdate", function($scope, $interval, $geoUpdate){

  $interval(()=>{
    $geoUpdate.updateLocation()
  }, 5000)

}])
