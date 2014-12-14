<%inherit file="../base.mako" />
<%namespace name="forms" file="../forms.mako" />

<div class="col-md-12">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <div class="login">
        
          <div class="panel panel-info">
            <div class="panel-heading">
              <div class="panel-title">Register</div>
            </div>
            <div class="panel-body">
              <%forms:form class_="form-horizontal" role="form" method="POST" action="" name="Register">
                <div class="form-group">
                  <label class="control-label col-sm-3" for="realname">Real name</label>
                  <div class="col-sm-8">
                    <input class="form-control" type="text" name="realname" placeholder="Real name">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-3" for="email">Email</label>
                  <div class="col-sm-8">
                    <input class="form-control" type="text" name="email" placeholder="Email">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-3" for="username">Username</label>
                  <div class="col-sm-8">
                    <input class="form-control" type="text" name="username" placeholder="Username" required>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-3" for="password">Password</label>
                  <div class="col-sm-8">
                    <input class="form-control" type="password" name="password" placeholder="Password" required>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-3" for="password_confirm">Confirm password</label>
                  <div class="col-sm-8">
                    <input class="form-control" type="password" name="password_confirm" placeholder="Password" required>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-md-3 col-md-offset-8">
                    <button type="submit" class="btn btn-info btn-block">Register</button>
                  </div>
                </div>
              </%forms:form>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-4">
        <h4>Already have an account?</h4>
        <a href="/login" class="btn btn-success">
          Login
        </a>
      </div>
      
    </div>
  </div>
</div>