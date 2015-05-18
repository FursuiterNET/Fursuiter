<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <link rel="stylesheet" id="stylesheet" href="/static/style/css/bootstrap.min.css">
  <link rel="stylesheet" href="/static/style/css/style.css">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script src="/static/lib/fursuiter.js"></script>
  <script src="/static/lib/bootstrap.min.js"></script>
  <script src="/static/lib/themeswitcher.js"></script>
  <%block name="pagetitle">
    <title>Fursuiter.net</title>
  </%block>
  <%block name="includes">
  </%block>
</head>
<body>
  <div class="messages" id="global-message-wrapper"></div>
  <div class="container-fluid">
%if not req.user or not req.user.username:
  ${self.body()}
%else:
  <%include file="navbar.mako" />
  <div class="well" id="leftbar">
    <%include file="leftbar.mako" />
  </div>
  <div id="content-root" class="container-fluid">
    ${self.body()}
    <div class="row well">
      <div class="col-md-4">
        <div class="list-group">
          <a href="//github.com/FursuiterNET/Fursuiter" class="list-group-item">Source on GitHub</a>
          <a href="//www.furstre.am/" target="_blank" class="list-group-item">Furstre.am</a>
          <a href="#" class="list-group-item">Terms of Service</a>
          <a href="#" class="list-group-item">Acceptable Upload Policy</a>
        </div>
      </div>
      <div class="col-md-8">
          <p>
              Created by the Fursuiter.net team
          </p>
          <p>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, facilis, incidunt, odio dolorem expedita cumque ullam quod fugit voluptatum unde laboriosam debitis id at rerum eaque recusandae culpa excepturi ratione! Lorem ipsum dolor sit amet, consectetur adipisicing elit. A, obcaecati, ullam aut necessitatibus architecto dolorem explicabo. Labore, cum necessitatibus saepe non quibusdam excepturi aspernatur fugit laborum ducimus? Reiciendis, sapiente, illum.
          </p>
      </div>
    </div>
  </div>
%endif
</body>
</html>
