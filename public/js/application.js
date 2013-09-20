$(document).ready(function() {
  $('#history').click(function(event) {
    event.preventDefault();

    $.get('/user/' + $('h4').data('name') +'/history','#stats', function(form) {
      $('#history').replaceWith(form);
  });

  });
});

