$(function(){
  $($('.new_comment').slice(1)).hide();
  $('.replay-link').on('click', function(e){
    e.preventDefault();
    // debugger
    $(this).hide();
    $(this).parent().find('.new_comment').show();
  })
})
