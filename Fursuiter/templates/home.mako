%if req.user:
<%inherit file="base.mako" />
<%namespace name="forms" file="forms.mako" />

<div class="row">
  <div class="hidden-sm hidden-xs col-md-3" id="identity-column">
    <div class="well">
      <div class="identity" style="text-align:center">
        <a href="/profile/">
          <img src="/static/demo/full_bg.png" alt="Copper's Icon" class="user-identity-icon img-circle img-responsive center-block" />
        </a>
        <h2>${req.user.realname}</h2>
        <h4>@${req.user.username}</h4>
      </div>
    </div>

    <ul class="list-group">
      <a href="/" class="list-group-item">
        <span class="glyphicon glyphicon-list"></span>
          Feed
      </a>
      <a href="/messages" class="list-group-item">
        <span class="pull-right badge">14</span>
        <span class="glyphicon glyphicon-envelope"></span>
          Inbox
      </a>
      <a href="/profile" class="list-group-item">
        <span class="glyphicon glyphicon-user"></span>
          Profile
      </a>
      <a href="/settings" class="list-group-item">
        <span class="glyphicon glyphicon-cog"></span>
          Settings
      </a>
    </ul>

    <p>
      Developer Features
    </p>
    <ul class="list-group">
      <a href="javascript:void(0)" class="list-group-item" id="theme-menu-toggle" data-toggle="dropdown">
        <span class="glyphicon glyphicon-eye-open"></span>
        Set Theme
        <span class="caret"></span>
      </a>
      <div id="theme-menu" role="menu" style="display:none">
        <a href="javascript:void(0)" class="list-group-item" data-theme="cerulean">Cerulean</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="cosmo">Cosmo</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="cyborg">Cyborg</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="darkly">Darkly</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="flatly">Flatly</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="journal">Journal</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="lumen">Lumen</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="paper">Paper</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="readable">Readable</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="sandstone">Sandstone</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="simplex">Simplex</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="slate">Slate</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="spacelab">Spacelab</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="superhero">Superhero</a>
        <a href="javascript:void(0)" class="list-group-item" data-theme="united">United</a>
      </div>
    </ul>

    <p>
      Copyright &copy; 2015 Fursuiter.net
    </p>
  </div>


  <div class="col-md-9 col-sm-12" id="content-column">
      <div class="content">
          <form action="javascript:void(0)" class="form well well-sm" id="message-form">
            <div class="form-group">
              <label for="message-input" class="control-label sr-only">Message</label>
              <textarea name="message" class="form-control" id="message-input" placeholder="Status Update" rows="3"></textarea>
            </div>
            <div class="form-group status-addon-group" data-addon-type="media">
              <div class="row">
                <div class="col-xs-6">
                  <a class="center-block" style="text-align:center">
                    <span class="span glyphicon glyphicon-folder-open" style="font-size:64px"></span><br>
                    Choose Existing
                  </a>
                </div>
                <div class="col-xs-6">
                  <a class="center-block" style="text-align:center">
                    <span class="span glyphicon glyphicon-upload" style="font-size:64px"></span><br>
                    Upload
                  </a>
                </div>
              </div>
            </div>
            <div class="form-group status-addon-group" data-addon-type="commission-status">
              <label for="commission-status-select" class="control-label">Status</label>
              <select name="commission-status" id="commission-status-select" class="form-control">
                <option value="open">Open</option>
                <option value="closed">Closed</option>
              </select>
            </div>
            <div class="form-group">
              <div class="btn-group">
                <button type="button" class="btn btn-default status-addon-button">
                  Normal Status
                </button>
                <button type="button" class="btn btn-default status-addon-button" data-addon-type="media">
                  <span class="glyphicon glyphicon-picture"></span>
                  Image / Video
                </button>
                <button type="button" class="btn btn-default status-addon-button" data-addon-type="commission-status">
                  <span class="glyphicon glyphicon-bullhorn"></span>
                  Commission Status
                </button>
              </div>
              <button type="submit" class="btn btn-primary pull-right">Post</button>
            </div>
          </form>
          <ul class="nav nav-tabs nav-justified" id="feed-nav">
              <li><a href="#popular" data-feed-id="feed-popular">Popular</a></li>
              <li><a href="#recent" class="default" data-feed-id="feed-recent">Recent</a></li>
              <li><a href="#social" data-feed-id="feed-social">Social</a></li>
              <li><a href="#events" data-feed-id="feed-events">Groups &amp; Events</a></li>
          </ul>
          <div class="feed-pane" id="feed-popular" data-cursor="" data-feed-name="popular">
            <p>Characters: ${req.user.characters}</p>
            <p>Email: ${req.user.email}</p>
            <p>Galleries: ${req.user.galleries}</p>
            <p>Groups: ${req.user.groups}</p>
            <p>ID: ${req.user.id}</p>
            <p>Level: ${req.user.level}</p>
            <p>Metadata: ${req.user.metadata}</p>
            <p>Password: ${req.user.password}</p>
            <p>Realname: ${req.user.realname}</p>
            <p>Submissions: ${req.user.submissions}</p>
            <p>Username: ${req.user.username}</p>
          </div>
          <div class="feed-pane" id="feed-recent" data-cursor="" data-feed-name="recent"></div>
          <div class="feed-pane" id="feed-social" data-cursor="" data-feed-name="social"></div>
          <div class="feed-pane" id="feed-events" data-cursor="" data-feed-name="events"></div>
      </div>
  </div>
</div>

<script src="/static/lib/home.js"></script>
<link rel="stylesheet" href="/static/style/css/home.css" id="stylesheet" />

%else:

<style>
  .jumbomaster-overlay {
    height: 540px;
    position: absolute;
    background-color: rgba(0,0,0,0.3);
    width: 100%;
    margin: -23px -15px 0 -15px;
  }

  .jumbomaster {
    height:540px;
    background: transparent url('/static/img/Capture.png') no-repeat top left;
    background-size: cover;
    box-shadow: rgba(0,0,0,0.15) 0 8px 0;
    margin:-23px -15px 0 -15px;
  }

  .all-white *, .all-white {
    color: #FFF !important;
  }

  .accordion .panel {
    box-shadow: rgba(0,0,0,0.1) 4px 4px 0
  }

  .heading-icon {
    padding:0 32px 12px 0;
    font-size:96px;
    float:left;
  }
</style>

<div class="jumbomaster-overlay"></div>
<div class="jumbomaster">
  <div class="container">
    <div class="row" style="min-height:102px;vertical-align:bottom;margin-top:1.5em;">
      <div class="col-sm-12 all-white">
        <h1>
          Fursuiter.net
        </h1>
        <h3>
          A community for fursuit makers, performers, and enthusiasts
        </h3>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div class="row">
    <div class="col-md-8 hidden-sm hidden-xs" style="margin-top:64px;">

      <div class="glyphicon glyphicon-picture heading-icon" style="padding-top:0"></div>
      <h3 style="margin-top:2px">
        Photos and Videos: It's All About Sharing
      </h3>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet, quis, delectus, expedita
        assumenda vitae atque commodi est alias harum obcaecati debitis quia reprehenderit libero
        non earum. Minima, magnam harum recusandae!
      </p>

      <p>
        Tenetur, provident, at, inventore minus sequi culpa consequatur nihil quos aut modi odit
        suscipit beatae possimus quia doloribus magni recusandae vel! Lorem ipsum dolor sit amet,
        consectetur adipisicing elit. Deleniti architecto corrupti et id similique dolorem nihil
        explicabo. Est, odio, aut, accusamus commodi quidem voluptatibus incidunt rem minus quis
        ca harum!
      </p>

      <hr class="clearfix">
      
      <div class="glyphicon glyphicon-heart heading-icon"></div>
      <h3>
        Your Characters have a Story Worth Telling!
      </h3>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut esse et impedit non repudiandae
        delectus similique amet ullam reprehenderit? Id, distinctio sapiente esse deleniti velit
        placeat nam quo quia dolorem? Lorem ipsum dolor sit amet, consectetur adipisicing elit.
      </p>

    </div>

    <div class="col-md-4">
      <div class="accordion" style="margin-top:-132px">
        <div class="panel panel-primary panel-toggleable">
          <div class="panel-heading">
            <div class="panel-title">Welcome back!</div>
          </div>
          <div class="panel-body">
            <%forms:form class_="form-horizontal" role="form" method="POST" action="/login" name="Login">

              <div class="form-group">
                <label for="loginUsername" class="control-label col-sm-4">Username</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" placeholder="Username" name="username" id="loginUsername" />
                </div>
              </div>

              <div class="form-group">
                <label for="loginPassword" class="control-label col-sm-4">Password</label>
                <div class="col-sm-8">
                  <input type="password" class="form-control" placeholder="Password" name="password" id="loginPassword" />
                </div>
              </div>

              <div class="form-group">
                  <label for="rememberLogin" class="control-label col-sm-4">Remember Me</label>
                <div class="col-sm-8">
                  <input type="checkbox" name="rememberLogin" id="rememberLogin" />
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-12">
                  <input type="submit" class="form-control btn btn-primary" value="Log In" />
                </div>
              </div>

              <div class="form-group">
                <div class="col-md-12">
                  <a href="#">I forgot my username</a>
                </div>
              </div>

              <div class="form-group">
                <div class="col-md-12">
                  <a href="#">I forgot my password</a>
                </div>
              </div>

            </%forms:form>
          </div>
        </div>

        <div class="register panel panel-info panel-toggleable">
          <div class="panel-heading">
            <div class="panel-title">New user? Register right now.</div>
          </div>
          <div class="panel-body" style="display:none;">
            <%forms:form class_="form-horizontal registration-form" role="form" method="POST" action="/register" name="Register">

              <div class="form-group">
                <label class="control-label col-sm-4" for="realname">Real name</label>
                <div class="col-sm-8">
                  <input class="form-control" type="text" name="realname" id="realname" placeholder="Real name">
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-4" for="email">Email</label>
                <div class="col-sm-8">
                  <input class="form-control" type="text" name="email" id="email" placeholder="Email">
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-4" for="username">Username</label>
                <div class="col-sm-8">
                  <div class="input-group">
                    <input class="form-control" type="text" name="username" id="username" placeholder="Username" required>
                    <div class="input-group-addon" id="username_label">
                      <span class="glyphicon glyphicon-minus"></span>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-sm-8 col-sm-offset-4" id="username_message" style="padding-bottom:16px"></div>

              <div class="form-group">
                <label class="control-label col-sm-4" for="password">Password</label>
                <div class="col-sm-8">
                  <div class='input-group'>
                    <input class="form-control" type="password" name="password" id="password" placeholder="Password" required>
                    <div class="input-group-addon" id="password_label">
                      <span class="glyphicon glyphicon-minus"></span>
                    </div>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-4" for="password_confirm">Confirm password</label>
                <div class="col-sm-8">
                  <div class="input-group">
                    <input class="form-control" type="password" name="password_confirm" id="password_confirm" placeholder="Confirm Password" required>
                    <div class="input-group-addon" id="password_confirm_label">
                      <span class="glyphicon glyphicon-minus"></span>
                    </div>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-12">
                  <input type="submit" value="Register" class="form-control btn btn-info" />
                </div>
              </div>

            </%forms:form>
          </div>
        </div>
      </div>
    </div>

  </div>
  <div class="row">
    <div class="col-sm-12">
      
    </div>
  </div>
</div>

<script>
$(document).ready(function(){
  $('body').on("click",".accordion .panel-toggleable .panel-heading",function(){
      $('.panel-shown').removeClass('panel-shown')
      $(this).parents('.panel').addClass('panel-shown').find('.panel-body').slideDown()
        .find('input[type=text]:visible:first').focus()
      $(this).parents('.accordion').find('.panel-toggleable:not(.panel-shown) .panel-body').slideUp()

    }).on("mouseover",".panel-toggleable .panel-heading",function(){
      $(this).css({opacity:0.8})

    }).on("mouseout",".panel-toggleable .panel-heading",function(){
      $(this).css({opacity:1})

    }).on("form","submit",function(){
      // Check form for required fields if client browser does not.
      if((prob=$(this).find('input[required]').filter(function(){return !$(this).val()}).first()).length){
        alert($(prob).attr('message')||("Please provide "+$(prob).prop('placeholder')+" input"))
        return false
      }
    })

    $('#loginUsername').focus()
  })
</script>
<script src="/static/lib/registerValidate.js"></script>

%endif
