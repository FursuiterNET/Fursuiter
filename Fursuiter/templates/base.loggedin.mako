<!DOCTYPE html>
<html lang="en" ng-app="fursuiter">
<head>

  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

  <!-- bower:css -->
  <link rel="stylesheet" href="../static/lib/bootswatch-dist/css/bootstrap.css" />
  <!-- endbower -->

  <link rel="stylesheet" href="/static/build/fursuiter.min.css">

  <!-- bower:js -->
  <script src="../static/lib/jquery/dist/jquery.js"></script>
  <script src="../static/lib/angular/angular.js"></script>
  <script src="../static/lib/angular-bootstrap/ui-bootstrap-tpls.js"></script>
  <script src="../static/lib/angular-cookies/angular-cookies.js"></script>
  <script src="../static/lib/get-style-property/get-style-property.js"></script>
  <script src="../static/lib/get-size/get-size.js"></script>
  <script src="../static/lib/eventie/eventie.js"></script>
  <script src="../static/lib/doc-ready/doc-ready.js"></script>
  <script src="../static/lib/eventEmitter/EventEmitter.js"></script>
  <script src="../static/lib/matches-selector/matches-selector.js"></script>
  <script src="../static/lib/outlayer/item.js"></script>
  <script src="../static/lib/outlayer/outlayer.js"></script>
  <script src="../static/lib/masonry/masonry.js"></script>
  <script src="../static/lib/imagesloaded/imagesloaded.js"></script>
  <script src="../static/lib/angular-masonry/angular-masonry.js"></script>
  <script src="../static/lib/bootswatch-dist/js/bootstrap.js"></script>
  <script src="../static/lib/ui-router/release/angular-ui-router.js"></script>
  <!-- endbower -->

  <script src="/static/build/fursuiter.min.js"></script>

  <%block name="pagetitle">
    <title>Fursuiter.net</title>
  </%block>

</head>

<body ng-controller="GlobalCtrl" ng-app>

  <%include file="shared/navbar.mako" />

  <div class="container" id="content-root" ng-class="leftbarVisible? 'leftbar-visible' : 'leftbar-hidden' " ui-view></div>

  <%include file="shared/footer.mako" />

  <%include file="shared/leftbar.mako" />

</body>

</html>
