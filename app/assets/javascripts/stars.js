Stars = (function(){
  'use strict';

  var stars = [
    { "description": "Todos los items retro!" },
    { "description": "Reliant Heart fue deployado exitosamente a produccion!" },
    { "description": "Pinhole esta utilizando correctamente la gema numerex_ldap" },
    { "description": "Terminamos FTF on schedule" },
    { "description": "Terminamos el refactor JS de SC on schedule" }
  ];

  var loadStars = function(){
    // ToDo: Retrieve real data
  };

  var displayStars = function(){
    $.each(stars, function(index, star){
      var newStarDiv = $('.star-container.hide').clone();
      newStarDiv.removeClass('hide');
      newStarDiv.find('.star-description').html(star.description)
      $('.container').append(newStarDiv);
    })
  };

  return {
    init: function(){
      loadStars();
      displayStars();
    }
  }
})();

$(function(){
  Stars.init();
})