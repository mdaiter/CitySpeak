function LightsCtrl($scope){
    $scope.red = 0;
    $scope.blue = 0;
    $scope.green = 0;

    $scope.pushData = function(){
        alert('Red:' + $scope.red);
    };
}
