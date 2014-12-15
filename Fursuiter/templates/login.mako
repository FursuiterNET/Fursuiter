<%inherit file="base.mako" />
<%namespace name="forms" file="forms.mako" />
<% messages = req.session.pop_flash('error') %>
% if messages is not None:
    % for error in messages:
    <div class="error">
        ${error}
    </div>
    % endfor
% endif
<div class="col-md-12">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <div class="login">
        
          <div class="panel panel-success">
            <div class="panel-heading">
              <div class="panel-title">Log In</div>
            </div>
            <div class="panel-body">
              <%forms:form class_="form-horizontal" role="form" action="" method="POST" name="Login">
                <div class="form-group">
                  <label class="control-label col-sm-3" for="username">Username</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" name="username" 
                     id="username" placeholder="Username" autofocus required>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-3" for="password">Password</label>
                  <div class="col-sm-8">
                    <input type="password" class="form-control" name="password" 
                     id="password" placeholder="Password" autofocus required>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-2 col-sm-offset-6">
                    <button type="submit" class="btn btn-success btn-block">Sign In</button>
                  </div>
                </div>
              </%forms:form>

              <div class="row">
                <div class="col-sm-8 col-sm-offset-3">
                  <a href="#">Forget your login?</a>
                </div>
              </div>

              <div class="row">
                <div class="col-sm-8 col-sm-offset-3">
                  <a href="#">Forget your password?</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-4">
        <h4>Don't have an account yet?</h4>
        <a href="/register" class="btn btn-info">
          Register
        </a>
      </div>
      
    </div>
  </div>
</div>