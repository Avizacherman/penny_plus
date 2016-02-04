
angular.module("MainModule").controller("LocationController", ["$http", "$scope", "$interval", "geoUpdate", function($http, $scope, $interval, geoUpdate){


$interval(()=>{
  geoUpdate.getLocation().then(pos=>{
    $scope.lat = pos.coords.latitude
    $scope.lng = pos.coords.longitude
})}, 500)

 // $interval()
}])
