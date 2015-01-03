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
  noMatch: "No",
  match: "Yes!",
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
    mat=(con=$('#password_confirm').val())==(pas=$('#password').val())
    $('#password_confirm_label').html((con&&pas)?ico(mat?'ok':'remove'):ico('minus'))
    $('#password_confirm_message').html((con&&pas)?window._regForm[mat?'match':'noMatch']:"")

  // Validate password strength
  }).on("keyup",".registration-form #password",function(){
    score = Math.min(evaluatePassword(name=$(this).val()),3)
    if(name){
      $('#password_label').html(ico(score?"ok":"remove"))
      $('#password_message').html(window._regForm.passwordStrength[score])
    } else {
      $('#password_label').html(ico("minus"))
      $('#password_message').html("")
    }

  })

  // Verify that given username is available
  liveInput(".registration-form #username",{
    route: "user/usernameExists",
    complete: function(res){
      $('#username_label').html(ico((res.EXISTS)?'remove':'ok'))
      $('#username_message').show().html(res.NOTE)
    },
    spinWrap: "#username_label",
    noinput: function(){
      $('#username_message').html("").hide()
      $('#username_label').html(ico('minus'))
    }
  })

  $('#username, #password, #password_confirm').trigger('keyup')
})