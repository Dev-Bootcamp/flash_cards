$(document).ready(function() {

  $('#history').click(function(event) {
    event.preventDefault();
    $.get('/user/' + $('h4').data('name') +'/history', function(form) {
      $('#history').replaceWith(form);
    });
  });

});

// $(document).ready(function() {

//   $('#guess').on('submit', function(event) {
//     event.preventDefault();
//     $.post('/user/' + $('#question').data('userid') + '/round/' + $('#question').data('roundid') + '/deck/' + $('#question').data('deckid') + '/card/' + $('#question').data('newcardid')), function(form) {
//       $('#question').replaceWith(form);  
//     }); 
//   });

// });
