angular.module('starter.controllers', ['starter'])

.controller('AppCtrl', function($scope, $ionicModal, $timeout, globalVariable, $state, $ionicPopup ) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});
  

  $scope.$on('$ionicView.enter', function(e) {

    var dataGlobal = globalVariable.getVar(); 
    $scope.doctor       = ( dataGlobal.userFlag == 'true' || dataGlobal.userFlag == true) ? true : false;
    $scope.patient      = ( dataGlobal.userFlag == 'true' || dataGlobal.userFlag == true ) ? false : true;
    $scope.categoryUser = dataGlobal.category;
    console.log('Category : ' + $scope.categoryUser)

  });

  $scope.doLogout = function () {

    var confirmPopup  = $ionicPopup.confirm({
                          title: 'Alert',
                          template: 'Are you sure you want to logout??'
                        });
            
    confirmPopup.then( function( res ) {

      if ( res ) {
        globalVariable.setVar();
        $state.go('login',{}, {reload: true});
      }
      
    });
  }
  
});
























  /*// Form data for the login modal
  $scope.loginData = {};

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeLogin = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.login = function() {
    $scope.modal.show();
  };

  // Perform the login action when the user submits the login form
  $scope.doLogin = function() {
    console.log('Doing login', $scope.loginData);

    // Simulate a login delay. Remove this and replace with your login
    // code if using a login system
    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  };
})

.controller('PlaylistsCtrl', function($scope, $http) {
  $scope.playlists = [
    { title: 'Reggae', id: 1 },
    { title: 'Chill', id: 2 },
    { title: 'Dubstep', id: 3 },
    { title: 'Indie', id: 4 },
    { title: 'Rap', id: 5 },
    { title: 'Cowbell', id: 6 }
  ];

  $http.get('http://zafea.my/apps/dataAll/type/test/format/json').success( function(response) {
        console.log( response )

    });
})

.controller('PlaylistCtrl', function($scope, $stateParams) {
});*/
