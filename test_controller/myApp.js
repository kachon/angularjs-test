// Generated by CoffeeScript 1.7.1
(function() {
  var MyService, myApp,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  myApp = angular.module('myApp', []);

  MyService = (function() {
    function MyService(message, service_data) {
      this.message = message;
      this.service_data = service_data;
      this.service2 = __bind(this.service2, this);
      this.service1 = __bind(this.service1, this);
      this.message = "my data";
      this.service_data = "dummy";
      this.items = [
        {
          col1: 111,
          col2: 222
        }, {
          col1: 333,
          col2: 444
        }, {
          col1: 555,
          col2: 666
        }
      ];
    }

    MyService.prototype.service1 = function(data) {
      console.log('service1 called');
      return this.service_data = data;
    };

    MyService.prototype.service2 = function(data) {
      console.log('service2 called');
      return this.service_data = data;
    };

    return MyService;

  })();

  myApp.factory('myDataService', (function(_this) {
    return function() {
      var myservice;
      return myservice = new MyService;
    };
  })(this));

  myApp.controller('MyCtrl1', (function(_this) {
    return function($scope, myDataService) {
      $scope.msg = "MyCtrl1";
      $scope.data = myDataService;
      $scope.items = myDataService.items;
      $scope.send = function(msg) {
        return $scope.data.service1(msg);
      };
      $scope.add = function() {
        return $scope.items.push({
          col1: 2222,
          col2: 2222222
        });
      };
      return $scope.remove = function(index) {
        console.log("Remove " + index);
        return $scope.items.splice(index, 1);
      };
    };
  })(this));

  myApp.controller('MyCtrl2', (function(_this) {
    return function($scope, myDataService) {
      $scope.msg = "MyCtrl2";
      return $scope.data = myDataService;
    };
  })(this));

}).call(this);