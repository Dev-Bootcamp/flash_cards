$(document).ready(function() {
  $('#history').click(function(event) {
    event.preventDefault();
    $.get('/user/' + $('h4').data('name') +'/history', function(form) {
      $('#history').replaceWith(form);
    });
  });
  $('#other').click(function(event) {
    console.log('clicked');
    event.preventDefault();
  });
});

// $(document).ready(function() {
//   $('#hide').click(function(event) {
//     console.log('clicked');
//     event.preventDefault();
//   });
// });

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

// $(document).ready(function() {
//   $('hide').click(function(event) {
//     event.preventDefault();
//     console.log('click');
//     $.get('/user/' + $('h4').data('name'), function(response) {
//       $('#history').replaceWith(response)
//     });
//     $('#hide').hide;
//   });
// });