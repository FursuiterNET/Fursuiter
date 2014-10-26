<%inherit file="../base.mako" />
<%namespace name="forms" file="../forms.mako" />

<div class="container-fluid">
  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <div class="register">
        <h1 class="title text-center">Register for Fursuiter.NET</h1>

        <%forms:form class_="form-horizontal" role="form" method="POST" action="" name="Register">
        <div class="form-group">
          <label class="control-label col-sm-2" for="realname">Real name</label>
          <div class="col-sm-6">
            <input class="form-control" type="text" name="realname" placeholder="Real name">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="username">Username</label>
          <div class="col-sm-6">
            <input class="form-control" type="text" name="username" placeholder="Username" required>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="password">Password</label>
          <div class="col-sm-6">
            <input class="form-control" type="password" name="password" placeholder="Password" required>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="password_confirm">Confirm password</label>
          <div class="col-sm-6">
            <input class="form-control" type="password" name="password_confirm" placeholder="Password" required>
          </div>
        </div>
        <div class="form-group">
          <div class="col-md-6 col-md-offset-3">
            <button type="submit" class="btn btn-primary btn-block">Register</button>
          </div>
        </div>
        </%forms:form>
      </div>
    </div>
  </div>
</div>
