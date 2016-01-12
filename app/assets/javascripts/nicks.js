$(document).ready(function($) {
  $('.generate_nickname').click( function (e) {
    game = $(this).attr('data-game');
    race = $(this).attr('data-race');
    sex = $(this).attr('data-sex');

    $.ajax({
      url: '/nicks/create.json?game=+' + game + '&race=' + race + '&sex=' + sex,
      success: function(nick) {
        $('#nickname').text(nick.name);
      }
    });
    e.preventDefault();
  });
});
