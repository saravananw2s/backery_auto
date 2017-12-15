angular.module('app').directive('lazyFormModel', function() {
  return {
    require: ['form'],
    
    compile: function compile(tElement, tAttrs) {
      
      var modelName = tAttrs.lazyFormModel;
       
      angular.forEach(tElement.find('input'), function(e) {
        var $e = angular.element(e);
        var name = $e.attr('name');
        
        var modelProperty = modelName + '.' + name;
        
        if($e.attr('type') == 'checkbox') {
          modelProperty += '.' + $e.attr('value');
        }
        
        $e.attr('ng-model', modelProperty);
      });
    }
  };
});