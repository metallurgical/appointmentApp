// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 
                           'starter.controllers',
                           'serviceModule',
                           'LoginModule',
                           'RegisterModule',
                           'angularSpinners',
                           //'DashboardModule',
                           'ConstantModule',
                           //'ionic-datepicker'
                           //'angular-datepicker'
                           ])
.run(function($ionicPlatform, $rootScope) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });

  

})

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider

  .state('app', {
    url: '/app',
    abstract: true,
    templateUrl: 'templates/menu.html',
    controller : 'AppCtrl'
    
  })
  .state('login', {
    url: '/login',
    templateUrl: 'templates/login.html'
  })
  .state('app.logout', {
    url: '/logout',
    views: {
      'menuContent': {
        template: '',
        controller : function ( $state, globalVariable, $timeout ) {
          //console.log('sd')
          globalVariable.setVar();
          //$state.reload();
          //$timeout( function () {
          $state.go('login',{}, {reload: true});
          //}, 100 );
          
          //$state.reload();
        }
      } 
    }
  })
  .state('register', {
    url: '/register',
    templateUrl: 'templates/register.html'
  })
  .state('app.dashboard', {
    url: '/dashboard',
    views: {
      'menuContent': {
        templateUrl: 'templates/dashboard.html'
      }
    }
  })
  .state('app.search', {
    url: '/search',
    views: {
      'menuContent': {
        templateUrl: 'templates/search.html'
      }
    }
  })
  .state('app.pAppointment', {
    url: '/pAppointment',
    views: {
      'menuContent': {
        templateUrl: 'templates/pAppointment.html'
      }
    }
  })
  .state('app.pAppointmentAdd', {
      url: '/pAppointmentAdd',
      views: {
        'menuContent': {
          templateUrl: 'templates/pAppointmentAdd.html'
        }
      }
  })
  .state('app.docAppointment', {
    url: '/docAppointment',
    views: {
      'menuContent': {
        templateUrl: 'templates/docAppointment.html'
      }
    }
  })
  .state('app.session', {
      url: '/session',
      views: {
        'menuContent': {
          templateUrl: 'templates/session.html'
        }
      }
  })
  .state('app.sessionAdd', {
      url: '/sessionAdd',
      views: {
        'menuContent': {
          templateUrl: 'templates/sessionAdd.html'
        }
      }
  })
  .state('app.playlists', {
    url: '/playlists',
    views: {
      'menuContent': {
        templateUrl: 'templates/playlists.html',
        controller: 'PlaylistsCtrl'
      }
    }
  })

  .state('app.single', {
    url: '/playlists/:playlistId',
    views: {
      'menuContent': {
        templateUrl: 'templates/playlist.html',
        controller: 'PlaylistCtrl'
      }
    }
  });
  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/login');
});
