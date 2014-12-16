<%inherit file="base.mako" />
<%namespace name="forms" file="forms.mako" />
<div class="col-md-12">
  <div class="container">
    <% messages = req.session.pop_flash('error') %>
    % if messages:
        % for error in messages:
        <div class="panel panel-warning">
          <div class="panel-heading">
              ${error}
          </div>
        </div>
        % endfor
    % endif
    <div class="row">
      <div class="col-md-8">
        <div class="login">
        
          <div class="well">
            <h2 class="col-sm-11 col-sm-offset-1">
              Log In
            </h2>
            <div class="well-content">
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
                  <div class="col-sm-3 col-sm-offset-8">
                    <button type="submit" class="btn btn-primary btn-block">Log In</button>
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