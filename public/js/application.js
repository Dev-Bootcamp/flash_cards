$(document).ready(function() {
  $('#history').click(function(event) {
    event.preventDefault();
    $.get('/user/' + $('h4').data('name') +'/history', function(form) {
      $('#history').replaceWith(form);
    });
  });
});

$(document).ready(function() {
  $('#guess').submit(function(event) {
    event.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.post(url, data, function(response) {
      $('#question').replaceWith(response);
    });
  });
});

