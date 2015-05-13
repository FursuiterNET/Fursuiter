function showCharacterEditor(characterId) {
    var show = function(){
        $('#user-character-list').slideUp()
        $('#user-character-editor').slideDown()
    }
    if(characterId) {
        ajax("/character/get/",{id:characterId},function(data){
            if(cdata = data.CHARACTER) {
                $('#user-character-editor-title').html("Editing "+cdata.name);
                for(k in cdata){$('.user-character-editor-input#character-'+k).val(cdata[k]);}
                show()
            } else {
                showMessage("There was an error loading the character data.");
            }
        })
    } else {
        // Clear all fields if no character ID given
        $('.user-character-editor-input').val("")
        $('#user-character-editor-title').html("Create New Character")
        show()
    }
}

function hideCharacterEditor() {
    $('.user-character-editor-input').val("")
    $('#user-character-list').slideDown()
    $('#user-character-editor').slideUp()
}

$(document).ready(function(){
    $('#new-character-button').on("click",function(){showCharacterEditor()})
    $('#user-character-editor-cancel').on("click",function(){hideCharacterEditor()})

    $('body').on("click",".character-edit-button",function(){
        showCharacterEditor($(this).attr('data-character-id'))
    }).on("click","#user-navbar a",function(e){
        e.preventDefault();
        $(this).tab('show');
    })
    if(window.location.href.indexOf('#') !== -1) {
        var fragment = window.location.href.substring(
                window.location.href.indexOf('#'));
        $('a[href="' + fragment + '"]').tab('show');
    }
})
