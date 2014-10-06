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
</head>
<body>
    <div class="container-fluid">
        <div class="navbar navbar-default" id="navbar">
            <div class="navbar-header">
                <a href="http://localhost:5000" class="navbar-brand">
                    Fursuiter.net
                </a>
                <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="glyphicon glyphicon-align-justify"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <div class="pull-right">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="profile">
                                @CopperBadger
                            </a>
                        </li>
                        <li>
                            <a href="upload">
                                <span class="glyphicon glyphicon-upload"></span>
                            </a>
                        </li>
                        <li>
                            <a href="notifications">
                                <span class="glyphicon glyphicon-globe"></span>
                            </a>
                        </li>
                        <li class="separator"></li>
                        <li>
                            <a href="security">
                                <span class="glyphicon glyphicon-lock"></span>
                            </a>
                        </li>
                        <li>
                            <a href="logout">
                                <span class="glyphicon glyphicon-log-out"></span>
                            </a>
                        </li>
                    </ul>
                </div>
                <form action="javascript:void(0)" class="form-inline navbar-form" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search" />
                        <button class="btn btn-default">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <div class="row" id="content-root">
            ${self.body()}
        </div>
        <div class="well" style="min-height:256px;margin-top:128px;">
            <div class="row">
                <div class="col-md-12">
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="list-group">
                        <a href="#" class="list-group-item">Source on GitHub</a>
                        <a href="http://www.furstre.am/" target="_blank" class="list-group-item">Furstre.am</a>
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
</body>
</html>