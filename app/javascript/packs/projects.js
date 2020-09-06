function donate() {
  var clicked = confirm("Thanks for your donation! Together we FightBack!")
  if (clicked){
    $('#donateModal').modal('hide')
  }
}
$(document).ready(function() {
  $('#donate-btn').on('click',function(){
    donate()
  })
})