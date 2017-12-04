$(document).ready(function() {
  var currentGame = {};

  characterListItem = function(character) {
    $.ajax({
      url: '/games/' + character.game_id + '/characters/' + character.id,
      type: 'GET',
    }).done(function(data) {
      $('#characters').append(data);
    }).fail(function(data) {
      console.log(data);
    });
  }

  $('.game-item').click(function() {

    var gameId = $(this).data('id');
    var gameName = $(this).data('name');

    $('#game').text('Characters in Game' + ' - ' + gameName);

    $.ajax({
      url: '/games/' + gameId + '/characters',
      type: 'GET',
      dataType: 'JSON',
    }).done(function(data) {
      var $characterList = $('#characters');
      $characterList.empty();
      data.forEach(function(character) {
        characterListItem(character);
      });
    }).fail(function(data) {
      console.log(data);
    });

  });

  // dynamic elements being added to the page
  $(document).on('click', '.char-delete', function() {

    var gameId = $(this).data('gameid');
    var id = $(this).data('id');
    var $listItem = $(this).parent();

    $.ajax({
      url: '/games/' + gameId + '/characters/' + id,
      type: 'DELETE',
      dataType: 'JSON'
    }).done(function(data) {
      console.log(data);
      $listItem.remove();
      Materialize.toast(data.message, 1000);
    }).fail(function(data) {
      // loop data of errors and show a toast for each one
      // call .join(',') in app controller and show single toast of errors
      // Materialize.toast(data, 4000)
      console.log(data);
    });

  });

});
