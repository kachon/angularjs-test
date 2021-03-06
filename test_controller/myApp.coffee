myApp = angular.module('myApp', ['ui.bootstrap', 'ngRoute', 'myControllers']);
myApp.config(['$routeProvider',
  ($routeProvider) ->
    $routeProvider.
      when('/ctrl1', {
          templateUrl: 'ctrl1.html'
          controller: 'MyCtrl1'
        }).
      when('/ctrl2', {
          templateUrl: 'ctrl2.html'
          controller: 'MyCtrl2'
        }).
      otherwise({
        redirectTo: '/ctrl1'
        })
])

myControllers = angular.module('myControllers', []);

class MyService
  constructor: (@message, @service_data) ->
    @message = "my data"
    @service_data = "dummy"
    @items = [
      {col1: 111, col2: 222}
      {col1: 333, col2: 444}
      {col1: 555, col2: 666}
    ]
 
  service1: (data) =>
    console.log 'service1 called'
    @service_data = data

  service2: (data) =>
    console.log 'service2 called'
    @service_data = data

# myApp.factory('myDataService', () =>
#   {
#     message: "my data"
#     service_data: "dummy"
#     service1: (data) =>
#       console.log 'service1 called'
#       @service_data = data
#     service2: (data) =>
#       console.log 'service2 called'
#       @service_data = data
#   }
# )

myApp.factory('myDataService', () =>
  myservice = new MyService
)

myControllers.controller('MyCtrl1', ($scope, myDataService) =>
  $scope.msg = "MyCtrl1"
  $scope.data = myDataService
  $scope.items = myDataService.items
  $scope.send = (msg) =>
    $scope.data.service1(msg)
  $scope.add = () =>
    $scope.items.push {col1: 2222, col2: 2222222}
  $scope.remove = (index) =>
    console.log "Remove #{index}"
    $scope.items.splice(index, 1)
)

myControllers.controller('MyCtrl2', ($scope, myDataService) =>
  $scope.msg = "MyCtrl2"
  $scope.data = myDataService
)

