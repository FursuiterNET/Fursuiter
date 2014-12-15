<%inherit file="../base.mako" />
<%namespace name="forms" file="../forms.mako" />

<div class="col-md-12">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <div class="register">
        
          <div class="well">
            <h2>
              Register
            </h2>
            <div class="well-content">
              <%forms:form class_="form-horizontal registration-form" role="form" method="POST" action="/resgister" name="Register">

                <div class="form-group">
                  <div class="row">
                    <label class="control-label col-sm-3" for="realname">Real name</label>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" name="realname" id="realname" placeholder="Real name">
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <div class="row">
                    <label class="control-label col-sm-3" for="email">Email</label>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" name="email" id="email" placeholder="Email">
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <div class="row">
                    <label class="control-label col-sm-3" for="username">Username</label>
                    <div class="col-sm-8">
                      <div class="input-group">
                        <input class="form-control" type="text" name="username" id="username" placeholder="Username" required>
                        <div class="input-group-addon" id="username_label">
                          <span class="glyphicon glyphicon-minus"></span>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-sm-9 col-sm-offset-3">
                      <span id="username_message"></span>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <div class="row">
                    <label class="control-label col-sm-3" for="password">Password</label>
                    <div class="col-sm-8">
                      <div class='input-group'>
                        <input class="form-control" type="password" name="password" id="password" placeholder="Password" required>
                        <div class="input-group-addon" id="password_label">
                          <span class="glyphicon glyphicon-minus"></span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-9 col-sm-offset-3">
                      Password Strength: <span id="password_message"></span>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <div class="row">
                    <label class="control-label col-sm-3" for="password_confirm">Confirm password</label>
                    <div class="col-sm-8">
                      <div class="input-group">
                        <input class="form-control" type="password" name="password_confirm" id="password_confirm" placeholder="Confirm Password" required>
                        <div class="input-group-addon" id="password_confirm_label">
                          <span class="glyphicon glyphicon-minus"></span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-9 col-sm-offset-3">
                      Passwords match: <span id="password_confirm_message"></span>
                    </div>
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

<script src="/static/lib/registerValidate.js"></script>
<script>
  $('.registration-form input[type=text]:visible:first').focus()
</script>