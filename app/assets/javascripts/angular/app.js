(function(){
  'use strict';
  var app = angular.module('cc-app',[]);
})();

// (function () {
//   'use strict';
//   var app = angular.module('cc-app', ['ui.bootstrap', 'ngSanitize', 'ngAnimate', 'ngMessages','chart.js','rzModule','ui.select','ngFileSaver', 'templates', 'xeditable', 'angularMoment', 'datatables', 'nvd3'])
//       .factory('httpInterceptor', ['$q', '$window' , function($q, $window){
//         return {
//           responseError: function(response){
//             if(response.status == 401 && response.data && response.data.error=='Your session has expired. Please login again.'){
//               $window.location.reload();
//               return;
//             }
//             return $q.reject(response);
//           }
//         }
//       }]);
//       app.config([
//         "$httpProvider", function($httpProvider) {
//           $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
//           $httpProvider.interceptors.push('httpInterceptor');
//         }
//       ])
//       .config(['$compileProvider', function ($compileProvider) {
//       }])
//       .config(['uiSelectConfig', function(uiSelectConfig){
//         uiSelectConfig.theme = 'bootstrap';
//         uiSelectConfig.skipFocusser = true;
//       }])

//       .filter('percentage', function () {
//         return function (input, percentof) {
//           var result = (parseFloat(percentof - input) / parseFloat(percentof) * 100).toFixed(2);
//           if (isNaN(result)) result = 0.00;
//           return result + "%";
//         }
//       })
//       .config(['$locationProvider',function($locationProvider) {
//         $locationProvider.hashPrefix('');
//         $locationProvider.html5Mode({
//           enabled: true,
//           requireBase: false
//         });
//       }])
//       .filter('sumFilter', function() {
//         return function(groups, key, mul) {
//           var total = 0;
//           mul = mul ? mul : 1;
//           if(groups && groups.length)
//           {
//               for (var i=0; i<groups.length; i++) {
//                   total = total + parseFloat(groups[i][key] || 0);
//               };
//           }

//           return total * mul;
//         };
//       })

//       .run(['DTDefaultOptions', function initDT(DTDefaultOptions) {
//               DTDefaultOptions.setLoadingTemplate('<div class="text-center" style="margin:10px 0px;"><i class="fa fa-circle-o-notch fa-spin fa-2x fa-fw"></i> <p>Processing...</p></div>');
//           }]
//       )

//       .run(['editableOptions', 'editableThemes', function (editableOptions, editableThemes) {
//         editableOptions.theme = 'bs3';

//         // overwrite submit button template
//         editableThemes['bs3'].submitTpl = '<button type="submit" class="btn btn-sm btn-warning"><i class="fa fa-check"></i></button>';
//         editableThemes['bs3'].resetTpl = '<button class="btn btn-sm" ><i class="fa fa-refresh"></i></button>';
//         editableThemes['bs3'].cancelTpl = '<button type="button" ng-click="$form.$cancel()" class="btn btn-sm"><i class="fa fa-times"></i></button>';
//       }])
//       .run(function(){
//         moment.locale('precise-en', {
//             relativeTime : {
//                 future : "in %s",
//                 past : "%s ago",
//                 s : "%d seconds", 
//                 m : "1 minute",
//                 mm : "%d minutes",
//                 h : "1 hour",
//                 hh : "%d hours",
//                 d : "1 day",
//                 dd : "%d days",
//                 M : "1 month",
//                 MM : "%d months",
//                 y : "1 year",
//                 yy : "%d years"
//             }
//         });
//       })
//     .directive('popoverElem', function(){
//         return{
//             link: function(scope, element, attrs) {
//                 element.on('click', function(){
//                     element.addClass('trigger');
//                 });
//             }
//         }
//     })
//       .directive('popoverClose', ['$timeout', function($timeout){
//         return{
//             scope: {
//                 excludeClass: '@'
//             },
//             link: function(scope, element, attrs) {
//                 var trigger = document.getElementsByClassName('trigger');

//                 function closeTrigger(i) {
//                     $timeout(function(){
//                         if( angular.element(trigger[0]).triggerHandler('click'))
//                         {
//                             angular.element(trigger[0]).triggerHandler('click').removeClass('trigger');
//                         }
//                     });
//                 }

//                 element.on('click', function(event){
//                     var etarget = angular.element(event.target);
//                     var tlength = trigger.length;
//                     if(!etarget.hasClass('trigger') && !etarget.hasClass(scope.excludeClass)) {
//                         for(var i=0; i<tlength; i++) {
//                             closeTrigger(i)
//                         }
//                     }
//                 });
//             }
//         };
//     }])
//       .filter('uppercase', function() {
//         return function(string, firstCharOnly) {
//             return (!firstCharOnly)
//                 ? string.toUpperCase()
//                 : string.charAt(0).toUpperCase() + string.slice(1);
//         }
//     })
//       .filter('fromNow', function(){
//         return function(dateString){
//           var date = moment(dateString, 'MM/DD/YYYY HH:mm:ss Z');
//           return date.fromNow();
//         }
//       })
//       .filter('secondsInWords', function(){
//         return function(seconds){
//           if(seconds == '1'){
//             return '1 second'
//           } else {
//             return moment.duration(parseInt(seconds), 's').locale('precise-en').humanize();
//           }
//         }
//       });
// })();