<html>
<head>
    <link rel="stylesheet" href="/static/style/css/style.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <title>Foobar</title>
    <script>
        function toggleUserMenu() {
            var um = $('.user-menu');
            console.log(um);
            if (um.css('visibility') !== 'hidden') {
                um.css({visibility: 'hidden'});
            } else {
                $('.user-menu').css({visibility: 'visible'});
            }
        }
    </script>
</head>
<body>
<div class="page-wrap">
    <div class="header">
        <div class="logo">
            Logo Goes HERE
        </div>
        <div class="user">
            <div class="links">
                Dreae
                <i style="font-size: 14pt;" class="fa fa-upload button"></i>

                <div class="notifications">
                    <i style="font-size: 14pt;" class="fa fa-bell"></i>

                    <div class="alert">14</div>
                </div>
            </div>
            <a href="javascript:void(0);" onclick="toggleUserMenu();">
                <img class="avatar" alt="avatar" src="static/demo/avatar.png">
            </a>

            <div class="user-menu">
                <div class="um_ar-2"></div>
                <div class="um_ar-1"></div>
                <div class="um-controls">
                    <img class="um-avatar" alt="avatar" src="static/demo/avatar.png">

                    <div class="um-links">
                        <strong>Dreae</strong>
                        <a href="#">Settings</a><span class="sep"></span><a href="#">Account</a>
                        <br><br>
                        <a href="#" class="btn-primary">View Profile</a>
                    </div>
                </div>
                <div class="um-characters">
                    <div class="um-character-wrap">
                        <div class="um-character">
                            <img class="um-char-av" alt="avatar" src="static/demo/avatar.png">

                            <div class="um-char-i">
                                <strong>Dreae</strong>
                                <small>Male - Otter</small>
                                <br>
                                <a href="#">Manage</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="um-actions">
                    <a href="#" class="btn-default pull-right" style="margin-top: 9px; margin-right: 12px;">Logout</a>
                </div>
            </div>
        </div>
    </div>
    ${self.body()}
</div>
</body>
</html>