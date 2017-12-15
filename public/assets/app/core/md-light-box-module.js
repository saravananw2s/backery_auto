angular.module('mdLightbox', ['ngMaterial'])
    .directive('mdLightbox', ['$mdDialog', function($mdDialog){
	return {
		link: function($scope, elem, attrs){

			elem.addClass('image-click');

		    elem.on('click',function(){		
		    	var image = attrs.src;
		    	var title = attrs.mdLightboxTitle;
		    	showLightboxModal(image, title);
				
			});

			//Lightbox Modal
		    function showLightboxModal(image, title) {
		        var confirm = $mdDialog.confirm({
		            template: '<md-dialog aria-label={{title}}><form ng-cloak><md-toolbar><div class=md-toolbar-tools><span flex></span><md-button class=md-icon-button ng-click=cancel()><md-icon aria-label="Close dialog"class=icon-static md-font-library=material-icons>close</md-icon></md-button></div></md-toolbar><md-dialog-content><div class=md-dialog-content><img alt={{title}} ng-src={{image}} style=margin:auto;max-width:100%></div></md-dialog-content></form></md-dialog>',
		            clickOutsideToClose: true,
		            controller: lightboxController
		        });

		        $mdDialog.show(confirm);

		        function lightboxController($scope, $mdDialog) {
		        	$scope.image = image;
		        	$scope.title = title;

		            $scope.cancel = function() {
		                $mdDialog.cancel();
		            };

		        }

		    }			
		}
	}
}]);