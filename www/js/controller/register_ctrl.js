angular.module('RegisterModule', ['starter', 'ui.bootstrap'])
.controller( 'Register_ctrl', RegisterCtrl );

RegisterCtrl.$inject = ['$scope', '$state', 'crud', '$ionicPopup'];
function RegisterCtrl( $scope, $state, crud, $ionicPopup) {

	$scope.doRegister = function ( user ) {

        var postData, category, formData;

        if ( user.category === 'doctor' ) {

        	category = 'docs';
        	formData = {
        		doc_name : user.name,
        		doc_ic : user.ic,
        		doc_gender : user.gender,
        		doc_address : user.address
        	}
        }
        else {

        	category = 'patients';
        	formData = {
        		patient_name : user.name,
        		patient_ic : user.ic,
        		patient_gender : user.gender,
        		patient_address : user.address
        	}
        }

        postData = {                             
            type : category, 
            formData : formData
        };

        crud.add( postData )
    	.success( function ( data1 ) {

    		var postData, id;
    		id = data1.id;

    		postData = {
    			type : 'users',
    			formData : {
    				id : id,
    				user_username : user.username,
    				user_password : user.password,
    				user_category : user.category
    			}
    		}

    		crud.add( postData )
    		.success( function ( data2 ) {

    			var alertPopup = $ionicPopup.alert({
				     title: 'Notification',
				     template: 'Successfull Register \n as ' + angular.uppercase( user.category ) + '. You may login now.'
			   	});

				alertPopup.then( function( res ) {
				    $state.go( 'login' );
				});
				
    		});

    	}); 
	}

	$scope.backToPage = function () {

		$state.go( 'login' );
	}
}


