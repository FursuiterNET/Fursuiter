$(document).ready(function(){
  $('body').on("click",".accordion .panel-toggleable .panel-heading",function(){
      $('.panel-shown').removeClass('panel-shown')
      $(this).parents('.panel').addClass('panel-shown').find('.panel-body').slideDown()
        .find('input[type=text]:visible:first').focus()
      $(this).parents('.accordion').find('.panel-toggleable:not(.panel-shown) .panel-body').slideUp()

    }).on("mouseover",".panel-toggleable .panel-heading",function(){
      $(this).css({opacity:0.8})

    }).on("mouseout",".panel-toggleable .panel-heading",function(){
      $(this).css({opacity:1})

    }).on("form","submit",function(){
      // Check form for required fields if client browser does not.
      if((prob=$(this).find('input[required]').filter(function(){return !$(this).val()}).first()).length){
        alert($(prob).attr('message')||("Please provide "+$(prob).prop('placeholder')+" input"))
        return false
      }
    })

  $('#loginUsername').focus()
})