<%inherit file="../base.mako" />

<div class="col-sm-4 col-md-3">
    <div class="well">
        <div class="identity" style="text-align: center;">
            <img src="/static/demo/full_bg.png"
                    alt="Copper's icon"
                    title="${character.name | h}"
                    class="img-circle img-responsive center-block identity-img" />
            <h2>${character.name | h}</h2>
            <h4><a href="#">${user.username}</a></h4>
        </div>
    </div>
</div>
<div class="col-sm-8">
    <h1 style="text-align: center;">TODO</h1>
    <p>Photos? Text posts? They probably go here.</p>
</div>
