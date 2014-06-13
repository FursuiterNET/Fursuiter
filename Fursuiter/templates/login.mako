<%inherit file="base.mako"/>
<% messages = request.session.pop_flash('error') %>
% if messages is not None:
    % for error in messages:
    <div class="error">
        ${error}
    </div>
    % endfor
% endif

<div class="centre">
    <div class="login">
        <h1 class="title">Login to Fursuits.NET</h1>
        <form class="form centre" role="form" action="/login" method="POST" name="Login">
            <div class="control">
                <label class="sr-only" for="username">Username</label>
                <input type="text" name="username" id="username" placeholder="Username" autofocus required>
            </div>
            <div class="control">
                <label class="sr-only" for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Password" autofocus required>
            </div>
            <div class="control">
                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
            </div>
        </form>
    </div>
</div>