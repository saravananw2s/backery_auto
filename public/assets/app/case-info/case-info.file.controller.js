function CaseFileCtrl($rootScope, $sce, $stateParams, $state, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api, dataToPass) {
    $scope.data = {};
    $scope.data.uploads = [];
    $scope.files = [];
    $scope.status = '';
    $scope.readonly = false;
    $scope.isFilesNull = true;
     $scope.status = 'Upload';
    if ($scope.lfApi) {
        $scope.lfApi.removeAll()
    }

    if(dataToPass.index === 'view')
    {
         $scope.readonly = true;
    }
    $scope.data.uploads = dataToPass.uploads;
    $scope.upload = function() {
        if ($scope.files.length > 0) {
            var upload = api.upload($scope.files);
             $scope.status = 'Uploading';
            upload().then().then(function(res) {
                $scope.status = 'Upload';
                var res = angular.fromJson(res);
                if (res.status == 'ok') {
                    if ($scope.lfApi) {
                        $scope.lfApi.removeAll()
                    }
                    $scope.files = [];
                    $scope.isFilesNull = true;
                    $scope.data.uploads = $scope.data.uploads.concat(res.data);
                } else {
                    $scope.status = res.data.data;
                }
            });
          
        }
    };
    $scope.cancel = function() {
        if ($scope.status === 'Upload') {
            var temp = {
                'uploads': $scope.data.uploads,
                'index': dataToPass.index,
            }
            $mdDialog.hide(temp);
        }
    };
    $scope.newfile = function(file) {
        $scope.data.uploads.splice(file, 1);
    }
}