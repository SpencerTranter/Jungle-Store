$(function(){
  $('.submit_review').prop('disabled', true);

  $('.review_description').on('input', function(){
    if($(this).val() === '' || $(this).val().length === 0){
      $('.submit_review').prop('disabled', true);
    }else {
      $('.submit_review').prop('disabled', false);
    }
  });

});