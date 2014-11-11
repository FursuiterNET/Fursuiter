<%inherit file="../base.mako"/>
<div class="col-sm-4 col-md-3">
    <div class="well">
        <div class="identity" style="text-align:center">
            <img src="/static/demo/full_bg.png" alt="Copper's Icon" class="img-circle img-responsive center-block" style="border:solid 6px rgba(0,0,0,0.2);max-width:240px;width:100%" />
            <h2>${user.realname}</h2>
            <h4>@${user.username}</h4>
        </div>
    </div>
</div>
<div class="col-sm-8">
    <h1 style="text-align: center">Characters</h1>
    <div class="col-sm-3">
        <div class="well">
            <img src="/static/demo/full_bg.png" alt="Cooper's Icon" class="img-circle img-responsive center-block">
            <h4 style="text-align: center">Character Name</h4>
        </div>
    </div>
</div>