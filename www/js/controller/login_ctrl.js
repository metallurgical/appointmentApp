angular.module('LoginModule', ['starter'])
.controller( 'LoginCtrl', LoginCtrl );

LoginCtrl.$inject = ['$scope', '$state', 'crud', '$ionicPopup', 'globalVariable'];
function LoginCtrl( $scope, $state, crud, $ionicPopup, gVar ) {
	//console.log(gVar.getVar())
	$scope.doLogin = function ( user ) {

		var params;

		params = 'dataAll/type/users/key/user_username-user_password/val/'+ user.username +'-'+user.password;
		crud.get( params )
		.success( function ( data ) {

			if ( data.users[0] ) {

				var alertPopup = $ionicPopup.alert({
				     title: 'Notification',
				     template: 'Successfull Login \n as ' + angular.uppercase( data.users[0].user_category ) + '. You will be redirect into dashboard.'
		   		});

				if ( data.users[0].user_category == 'doctor' ) gVar.setVar( true,  data.users[0].user_category, data.users[0].id );
				else gVar.setVar( false,  data.users[0].user_category, data.users[0].id );

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