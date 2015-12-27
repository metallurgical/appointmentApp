angular
.module('starter')
.factory('Auth', function (){ 
   
   	var authVal = {};

    authVal.doAuth = function( method ){ 
      
        if( !method ){ 
          	method = "GET_n_POST";
        }

     	switch( method ) {

        	case 'DELETE' : 

            	var config = {

            			headers: {

		                  	'Accept': 'application/json;odata=verbose',
		                  	"X-Testing" : "testing",
		                  	'X-HTTP-Method-Override' : 'DELETE'
              			}
          		};
        	return config;
        	break;

        	case 'GET_n_POST' : 

          		var config = {
          				headers: {
                  	
                  			'Accept': 'application/json;odata=verbose',
                  			"X-Testing" : "testing"
              			}
          		};
          	return config;
        	break;

        	case 'PUT' : 
          		var config = {
          				headers: {
                  	
                  			'Accept': 'application/json;odata=verbose',
                  			"X-Testing" : "testing",
                  			'X-HTTP-Method-Override' : 'PUT'
              			}
          		};
        	return config;
        	break;
                   
      	}
              
    }

    return authVal;
})
.factory( 'crud', function ( $http, myConfig, $ionicPopup, Auth ) {

	var url, fn = {}, setUrl;

	setUrl = function ( params ) {
		
		return myConfig.url + ( params  || 'dataAll' );

	}

	fn.getData = function( params ) {

        return $http.get( setUrl( params ) );
                
    }

    fn.addData = function( data ) {
        
        return $http.post( setUrl(), data );

    }

    fn.deleteData = function( params ) {
      
        url = myConfig.url + params;          
        var confirmPopup  = $ionicPopup.confirm({
                             	title: 'Delete Confirmation',
                             	template: 'Are you sure you want to delete this data?'
                           	});
            
     	confirmPopup.then( function( res ) {
      		
      		if( res ) {
          		$http.get( setUrl( params ), Auth.doAuth( 'DELETE' ) )        
         	} 
         	else {
         		console.log('You are not sure dihhh');
         	}

    	});
    }

    fn.updateData = function( params, data ) {

    	return $http.post( setUrl( params ), data, Auth.doAuth( 'PUT' ) );

    }

    return {
    	get 	: fn.getData,
    	add 	: fn.addData,
    	delete 	: fn.deleteData,
    	update 	: fn.updateData
    }
})