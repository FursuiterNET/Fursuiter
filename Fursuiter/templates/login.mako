<%inherit file="base.mako"/>
<%namespace name="forms" file="forms.mako"/>
<% messages = req.session.pop_flash('error') %>
% if messages is not None:
    % for error in messages:
    <div class="error">
        ${error}
    </div>
    % endfor
% endif

<div class="container-fluid">
  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <div class="login">
        <h1 class="title text-center">Login to Fursuits.NET</h1>
      
        <%forms:form class_="form-horizontal" role="form" action="" method="POST" name="Login">
          <div class="form-group">
            <label class="control-label col-sm-2" for="username">Username</label>
            <div class="col-sm-6">
              <input type="text" class="form-control" name="username" 
               id="username" placeholder="Username" autofocus required>
            </div>
            <div class="control-hint col-md-4">
              <a href="#">Forgot your login?</a>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="password">Password</label>
            <div class="col-sm-6">
              <input type="password" class="form-control" name="password" 
               id="password" placeholder="Password" autofocus required>
            </div>
            <div class="control-hint col-md-4">
              <a href="#">Forgot your password?</a>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
              <button type="submit" class="btn btn-primary btn-block">Sign In</button>
            </div>
          </div>
        </%forms:form>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <h2 class="text-center">Don't have an account yet?</h2>
      <a href="#" class="btn btn-success btn-block">Register</a> 
    </div>
  </div>
</div>
