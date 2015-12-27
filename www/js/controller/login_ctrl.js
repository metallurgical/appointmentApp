angular.module('LoginModule', ['starter'])
.controller( 'LoginCtrl', LoginCtrl );

LoginCtrl.$inject = ['$scope', '$state', 'crud', '$ionicPopup'];
function LoginCtrl( $scope, $state, crud, $ionicPopup) {
	
	$scope.doLogin = function ( user ) {

		var params;

		params = 'login/type/users/key/user_username/val/'+ user.username +'/key1/user_password/val1/'+ user.password;
		crud.get( params )
		.success( function ( data ) {

			if ( data.users[0] ) {

				var alertPopup = $ionicPopup.alert({
				     title: 'Notification',
				     template: 'Successfull Login \n as ' + angular.uppercase( data.users[0].user_category ) + '. You will be redirect into dashboard.'
		   		});

		   		alertPopup.then( function( res ) {
			    	$state.go( 'app.dashboard' );
				});

			}
			else {

				var alertPopup = $ionicPopup.alert({
				     title: 'Notification',
				     template: 'Incorrect username or password. Please try again.'
		   		});
		   		
			}

			
		});
	}

};