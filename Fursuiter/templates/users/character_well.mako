<%def name="character_well(character)">
    <div class="col-sm-3">
        <div class="well">
            <img src="/static/demo/full_bg.png"
                 alt="${character.name | h}"
                 title="${character.name | h}"
                 class="img-circle img-responsive center-block">
            <h4 style="text-align: center;">
                <a href="/user/${user.username | u}/character/${character.name | u}">${character.name | h}</a>
            </h4>
        </div>
    </div>
</%def>
