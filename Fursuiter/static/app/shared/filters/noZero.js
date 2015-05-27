app.filter('noZero',function(){
  return function(input){
    return (parseInt(input)==0)?'':input;
  }
})