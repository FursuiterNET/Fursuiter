<%def name="character_well(character)">
    <div class="col-xs-12">
        <div class="well">
            <div class="row">
                <div class="col-sm-3">
                    <img src="/static/demo/none.png"
                         alt="${character.name | h}"
                         title="${character.name | h}"
                         class="img-responsive img-rounded"
                         style="width:100%" />
                </div>
                <div class="col-sm-9">
                    <h3>
                        <a href="/user/${user.username | u}/character/${character.name | u}">${character.name | h}</a>
                        <small>
                            &middot; ${character.species}
                        </small>
                    </h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque nobis dolores culpa id, nostrum aut. Placeat consequatur, inventore ex non odit vitae doloribus quam accusamus mollitia, harum, blanditiis, error. Neque.
                    </p>
                </div>
            </div>
        </div>
    </div>
</%def>
