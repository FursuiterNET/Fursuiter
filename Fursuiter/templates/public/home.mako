<%inherit file="base.mako" />

<div class="container">
  <div class="row">

    <div class="col-md-4 col-sm-12 col-md-push-8">

      <div class="panel panel-default clearfix">
        <form action="/login" method="POST" id="login-form">
          <div class="row" id="login-form-top">
            <div class="col-xs-6" style="padding-right:2px">
              <div class="form-group">
                <label for="username-input">Username</label>
                <input type="text" name="username" class="form-control input-sm" tabindex="1" id="username-input" placeholder="Username">
              </div>
            </div>
            <div class="col-xs-6" style="padding-left:2px">
              <div class="form-group">
                <label for="password-input">Password</label> &middot; <a href="/forgot">Forgot?</a>
                <input type="password" name="password" class="form-control input-sm" tabindex="2" id="password-input" placeholder="Password">
              </div>
            </div>
          </div>
          <div class="form-group panel-footer clearfix" id="login-form-bottom">
            <div class="pull-right">
              <label>
                Remember me <input type="checkbox" tabindex="3" name="remember" value="1">
              </label>
              <button type="submit" tabindex="4" class="btn btn-primary btn-sm">Log In</button>
            </div>
          </div>
        </form>
      </div>

      <a href="/register">New user? Register here!</a>
    </div>

    <div class="col-md-8 col-md-pull-4">
      <div id="welcome-blob" class="img-rounded">
        <h1 id="welcome-header">
          A community for fursuit performers, makers and enthusiasts
        </h1>

        <small class="text-muted">
          Don't worry, this crappy home page is only temporary. ${req.user}
        </small>
      </div>
    </div>
  </div>
</div>
