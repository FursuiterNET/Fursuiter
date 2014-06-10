<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="/static/style/css/style.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="/static/lib/fursuiter.js"></script>
</head>
<body>
<div class="page-wrap">
    <div class="header">
        <div class="nav-toggle">
            <i class="fa fa-paw fa-lg"></i>
        </div>
        <div class="logo"><h2>Fursuiter</h2></div>
        <div class="note-icon">
            <i class="fa fa-bell-o fa-lg"></i>

            <div class="count">12</div>
        </div>
        <div class="note-icon">
            <i class="fa fa-envelope-o fa-lg"></i>

            <div class="count">14</div>
        </div>
        <div class="note-icon">
            <i class="fa fa-search fa-lg"></i>
        </div>
        <div class="clock">
            <span id="hours" class="hmin"></span>
            <span id="minutes" class="hmin"></span>
            <span id="seconds"></span>
        </div>
    </div>
    <div class="nav-menu">
        <a href="#" class="active">
            <i class="fa fa-home fa-2x fa-fw"></i>
        </a>
        <a href="#">
            <i class="fa fa-picture-o fa-2x fa-fw"></i>
        </a>
        <a href="#">
            <i class="fa fa-users fa-2x fa-fw"></i>
        </a>
        <a href="#">
            <i class="fa fa-calendar fa-2x fa-fw"></i>
        </a>
        <a href="#">
            <i class="fa fa-info-circle fa-2x fa-fw"></i>
        </a>

        <div class="vsep"></div>
        <a href="#">
            <i class="fa fa-upload fa-2x fa-fw"></i>
        </a>
        <a href="#">
            <i class="fa fa-cog fa-2x fa-fw"></i>
        </a>
        <a href="#">
            <i class="fa fa-sign-out fa-2x fa-fw"></i>
        </a>
    </div>
    ${self.body()}
</div>
</body>
</html>