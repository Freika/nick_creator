$(document).ready(function($) {
  $('#generate_nickname').click( function () {
    $.ajax({
      url: '/nicks/create',
      success: function(nick) {
        $('#nickname').text(nick.name);
      }
    });
  });
});
