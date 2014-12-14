<%inherit file="base.mako" />
<%namespace name="forms" file="forms.mako" />
%if req.user:
<div class="col-sm-4 col-md-3">
  <div class="well">
    <div class="identity" style="text-align:center">
      <img src="/static/demo/full_bg.png" alt="Copper's Icon" class="img-circle img-responsive center-block" style="border:solid 6px rgba(0,0,0,0.2);max-width:240px;width:100%" />
      <h2>Copper</h2>
      <h4>@CopperBadger</h4>
    </div>
  </div>

  <div class="list-group">
    <a href="#feed" class="list-group-item">
      <span class="glyphicon glyphicon-list"></span>
        Feed
    </a>
    <a href="#inbox" class="list-group-item">
      <span class="pull-right badge">14</span>
      <span class="glyphicon glyphicon-envelope"></span>
        Inbox
    </a>
    <a href="#profile" class="list-group-item">
      <span class="glyphicon glyphicon-user"></span>
        Profile
    </a>
    <a href="#settings" class="list-group-item">
      <span class="glyphicon glyphicon-cog"></span>
        Settings
    </a>
  </div>

  <p>
    Copyright &copy; 2014 Fursuiter.net
  </p>
</div>

<div class="col-sm-8 col-md-9">
    <div class="content">
        <ul class="nav nav-pills nav-justified" style="margin-bottom:6px">
            <li><a href="popular">Popular</a></li>
            <li class="active"><a href="recent">Recent</a></li>
            <li><a href="social">Social</a></li>
            <li><a href="events">Groups &amp; Events</a></li>
        </ul>
        <div class="media-list">
            <div class="media well">
                <a href="user/dreae" class="pull-left user-icon img-responsive">
                    <img src="/static/demo/avatar.png" alt="Dreae" class="media-object img-rounded img-responsive">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">
                        <a href="user/dreae">
                            <strong>Dreae</strong>
                        </a> updated his status
                    </h4>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam, quas, ut, dolore et nostrum ipsam veritatis consectetur commodi harum totam necessitatibus magni iusto fugit officia aut vitae qui. Ullam, quas!
                    </p>
                </div>
            </div>

            <div class="media well">
                <a href="user/rechner" class="pull-left user-icon">
                    <img src="/static/demo/rechner.jpg" alt="Rechner Fox" class="media-object img-rounded img-responsive">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">
                        <a href="user/rechner">
                            <strong>Rechner</strong>
                        </a> updated his status
                    </h4>
                    <p>
                        HTML5 and WebM would be the format of choice, with a fallback to mp4/flash if needed.  Flash is going the way of the dinosaur though so we'll want to weigh the options.
                    </p>
                    <p>
                        Many people already upload to Youtube so making it easy to embed videos instead of uploading them outright would be something to look at.
                    </p>
                </div>
            </div>

            <div class="media well">
                <a href="user/jacktail" class="pull-left user-icon">
                    <img src="/static/demo/JackTail.jpg" alt="JackTail" class="media-object img-rounded img-responsive">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">
                        <a href="user/rechner">
                            <strong>JackTail</strong>
                        </a> updated his status
                    </h4>
                    <p>
                        Fursuiter.net is underway!
                    </p>
                </div>
            </div>

            <div class="media well">
                <a href="user/rechner" class="pull-left user-icon">
                    <img src="/static/demo/rechner.jpg" alt="Rechner Fox" class="media-object img-rounded img-responsive">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">
                        <a href="user/rechner">
                            <strong>Rechner</strong>
                        </a> changed his commission status
                    </h4>
                    <span style="font-size:24pt">
                        <span class="glyphicon glyphicon-star"></span> Open for Commissions!
                    </span>
                    <p>
                        I'm opening 5 commission spots.
                    </p>
                </div>
            </div>

            <div class="media well">
                <a href="user/grenrir" class="pull-left user-icon">
                    <img src="/static/demo/grenrir.jpg" alt="Grenrir Hunstman" class="media-object img-rounded img-responsive">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">
                        <a href="user/rechner">
                            <strong>Grenrir</strong>
                        </a> updated his status
                    </h4>
                    <p>
                        Dedicated hosting can be pretty cheap. Since our site is going to be heavily database driven, I would take a REALLY close look at the Terms of Service to make sure there is no limitations/restrictions being put on CPU utilization and disk I/O. Many placed will lure you in with these unlimited packages, but hidden in there would be limitations on CPU and Disk usage.
                    </p>
                    <p>
                        I can take the lead on researching. Dedicated hosting as well as cloud services (like Amzon AWS or Azure) may pay off better in the long run, but we need to do some performance testing to know for sure.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
%else:

<div class="container">
  <div class="row">
    <div class="col-md-8">
      <div class="jumbotron">
        <h1>
          Fursuiter.NET
        </h1>
        <h3>
          A community for fursuit makers, performers, and enthusiasts.
        </h3>
      </div>
    </div>

    <div class="col-md-4">
      <div class="accordion">
        <div class="panel panel-success panel-toggleable">
          <div class="panel-heading">
            <div class="panel-title">Log In</div>
          </div>
          <div class="panel-body">
            <form class="form-horizontal" role="form" method="POST" action="" name="Login">
              <div class="form-group">
                <label for="username" class="control-label col-sm-4">Username</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" placeholder="Username" name="username" id="username" />
                </div>
              </div>
              <div class="form-group">
                <label for="password" class="control-label col-sm-4">Password</label>
                <div class="col-sm-8">
                  <input type="password" class="form-control" placeholder="Password" name="password" id="password" />
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-10 col-sm-offset-1">
                  <label for="rememberLogin" class="control-label">Remember Me</label>
                  <input type="checkbox" name="rememberLogin" id="rememberLogin" />
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-12">
                  <input type="submit" class="form-control btn btn-success" value="Log In" />
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
            <form>
          </div>
        </div>

        <div class="register panel panel-info panel-toggleable">
          <div class="panel-heading">
            <div class="panel-title">New User?</div>
            Register today!
          </div>
          <div class="panel-body" style="display:none;">
            <%forms:form class_="form-horizontal" role="form" method="POST" action="" name="Register">
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
                <label class="control-label col-sm-4" for="register_username">Username</label>
                <div class="col-sm-8">
                  <input class="form-control" type="text" name="username" id="register_username" placeholder="Username" required>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-sm-4" for="register_password">Password</label>
                <div class="col-sm-8">
                  <input class="form-control" type="password" name="password" id="register_password" placeholder="Password" required>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-sm-4" for="register_password_confirm">Confirm password</label>
                <div class="col-sm-8">
                  <input class="form-control" type="password" name="password_confirm" id="register_password_confirm" placeholder="Confirm Password" required>
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
</div>

<script>
$(document).ready(function(){
  $('body').on("click",".accordion .panel-toggleable .panel-heading",function(){
      $('.panel-shown').removeClass('panel-shown')
      $(this).parents('.panel').addClass('panel-shown').find('.panel-body').slideDown()
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
  })
</script>

%endif
