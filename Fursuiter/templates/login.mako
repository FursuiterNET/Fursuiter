<%inherit file="base.mako"/>
<% messages = request.session.flash('error') %>
% if messages is not None:
    % for error in messages:
    <div class="error">
        ${error}
    </div>
    % endfor
% endif

<div class="login">
    <h1 class="title">Login to Fursuits.NET</h1>
    <form class="form" role="form" action="/login" method="POST" name="Login">
        <input type="text" name="username" id="username" placeholder="Username">
        <input type="password" name="password" id="password" placeholder="Password">
        <button type="submit" class="btn btn-primary btn-block">Sign In</button>
    </form>
</div>