/*
  Provide visual feedback to user filling out registration form. Form must have
  class "registration-form"
 */

window._regForm = {
  passwordStrength:{
    0: "Weak (must be at least six characters long with at least one number)",
    1: "Fair",
    2: "Good",
    3: "<strong>Strong</strong>"
  },
  required: "<em>Passwords must be at least six characters long and contain at least one number</em>",
  noMatch: "Passwords must match",
  timeout: 0,
  exists: function(name){return "<em>Sorry, username <strong>"+name+"</strong> has already been taken</em>"},
  available: function(name){return "Hooray! <strong>"+name+"</strong> is available!"}
}

function evaluatePassword(wd){

  // Evaluate password strength, return index of password strenth (0 if unfit)
  len = wd.length
  num = wd.search(/\d/)!=-1
  if(len<6||!num){
    return 0
  } else {
    out = 0
    out += len>=10 // Extra point for pwd at least 10 characters...
    out += num // ... containing a number...
    out += wd.search(/[A-Z]/)!=-1 // ... or containing an uppercase
    return out
  }  
}

$(document).ready(function(){

  // Check that password and confirmation match
  $('body').on("keyup",".registration-form #password_confirm, .registration-form #password",function(){
    (par=$(this).parents('.registration-form')).find('#password_confirm_label')
      .html(ico(mat=par.find('#password_confirm').val()==par.find('#password').val()?'ok':'remove')).end()
      .find('#password_confirm_message').html(mat?"":window._regForm.noMatch)

  // Validate password strength
  }).on("keyup",".registration-form #password",function(){
    score = Math.min(evaluatePassword($(this).val()),3)
    $(this).parents('.form-group')
      .find('#password_label').html(ico(score?"ok":"remove")).end()
      .find("#password_message").html(window._regForm.passwordStrength[score])

  // Verify that given username is available
  }).on("keyup",".registration-form #username",function(){
    clearTimeout(window._regForm.usernameTimeout)
    name = $(this).val()
    if(name){
      window._regForm.usernameTimeout = setTimeout(function(){
        i = $(ico('cog'));
        $('#username_label').html(i);
        s = spin(i)
        ajax("users/usernameExists",{name:name},function(res){
          s()
          $(this).parents('.form-group')
            .find('#username_label').html(ico((res=res=="true")?'remove':'ok')).end()
            .find('#username_message').html(window._regForm[res?'exists':'available'](name))
        })
      },250)
    }
  })
})