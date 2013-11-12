var BambooPage = (function () {

  var hideAuthor = function () {
    $('.build .reason').hide();
  }

  var hideGroup = function () {
    $('.build .project-name').hide();
  }

  return {
    init: function() {
      hideAuthor();
      hideGroup();
    }
  }
})();

$('document').ready(function() {
  BambooPage.init();
});