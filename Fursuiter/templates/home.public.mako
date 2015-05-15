<%block name="includes">
  <script src="/static/lib/home.public.js"></script>
  <script src="/static/lib/registerValidate.js"></script>
  <link rel="stylesheet" href="/static/style/css/home.public.css">
</%block>

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
        Photos and Videos: Its All About Sharing
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