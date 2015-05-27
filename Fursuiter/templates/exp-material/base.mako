<!DOCTYPE html>
<html lang="en" ng-app="fursuiter">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <!-- <link rel="stylesheet" id="stylesheet" href="/static/style/css/bootstrap.min.css"> -->
  <!-- <link rel="stylesheet" href="/static/style/css/style.css"> -->
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/angular_material/0.9.0/angular-material.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=RobotoDraft:300,400,500,700,400italic">
  <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular-cookies.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-animate.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-aria.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angular_material/0.9.0/angular-material.min.js"></script>
  <!--<script src="/static/lib/ui-bootstrap.min.js"></script>-->
  <!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>-->
  <script src="/static/lib/fursuiter.js"></script>
  <!--<script src="/static/lib/bootstrap.min.js"></script>-->
  <!--<script src="/static/lib/themeswitcher.js"></script>-->
  <!--<script src="/static/lib/js.cookie.min.js"></script>-->
  <%block name="pagetitle">
    <title>Fursuiter.net</title>
  </%block>
  <%block name="includes"></%block>
</head>
<body layout="column" ng-controller="globalCtrl">
  <md-toolbar layout="row" class="md-whiteframe-z1">
    <h1 class="md-toolbar-tools">Hello</h1>
  </md-toolbar>

  <md-content layout="row" flex>
    <md-sidenav layout="column" md-component-id="leftbar" class="md-sidenav-left md-whiteframe-z2">
      <%include file="leftbar.mako" />
    </md-sidenav>
    <div layout="column">
      <md-button ng-click="leftbarToggle()">
        Toggle Leftbar
      </md-button>
      <table>
        <tr>
          <th>Title 1</th>
          <th>Title 2</th>
          <th>Title 3</th>
        </tr>
        <tr>
          <td>Copper Badger</td>
          <td>Badgerdoggy</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>Rechner Fox</td>
          <td>Red Fox</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>Jack Tail</td>
          <td>Cheetah</td>
          <td>No</td>
        </tr>
        <tr>
          <td>Mankeulv Coyote</td>
          <td>Coyote</td>
          <td>No</td>
        </tr>
        <tr>
          <td>Dreae Otter</td>
          <td>River Otter</td>
          <td>Yes</td>
        </tr>
      </table>
    </div>
  </md-content>
</body>
</html>
