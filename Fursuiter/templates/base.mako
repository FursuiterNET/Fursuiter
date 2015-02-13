<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <link rel="stylesheet" href="/static/style/css/bootstrap.min.css">
  <link rel="stylesheet" href="/static/style/css/style.css">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script src="/static/lib/fursuiter.js"></script>
  <script src="/static/lib/bootstrap.min.js"></script>
  <%block name="pagetitle">
  <title>Fursuiter.net</title>
  </%block>
</head>
<body>
  <div class="container-fluid">
%if req.path == "/":
  ${self.body()}
%else:
  %if req.user:
    <div class="navbar navbar-default" id="navbar">
      <div class="container" style="padding:2px">
        <div class="navbar-header">
          <a href="/" class="navbar-brand" title="Fursuiter.net Home">
            Fursuiter.net
          </a>
          <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
              <span class="glyphicon glyphicon-align-justify"></span>
          </button>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">
          <div class="pull-right">
            <%include file="navbar.mako" />
          </div>
          <form action="/search" method="GET" class="form-inline navbar-form" role="search">
            <div class="form-group">
              <input type="text" name="q" class="form-control" placeholder="Search" />
            </div>
            <div class="form-group">
              <button class="btn btn-default btn-block" title="Search">
                  <span class="glyphicon glyphicon-search"></span>
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  %else:
    <div class="navbar navbar-default" id="navbar">
      <div class="container">
        <div class="navbar-header">
          <a href="/" class="navbar-brand" title="Fursuiter.net">
            Fursuiter.net
          </a>
        </div>
      </div>
    </div>
  %endif
  <div id="content-root" class="container">
      ${self.body()}
  </div>
%endif
    <div class="well" style="min-height:256px;margin-top:128px;">
      <div class="container">
        <div class="row">
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
    </div>
  </div>
</body>
</html>
