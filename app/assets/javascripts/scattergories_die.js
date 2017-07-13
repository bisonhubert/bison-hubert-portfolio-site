$(document).on('turbolinks:load', function() {
  $(document).ready(function() {
    var LETTER_MAP = {
      1: 'A',
      2: 'B',
      3: 'C',
      4: 'D',
      5: 'E',
      6: 'F',
      7: 'G',
      8: 'H',
      9: 'I',
      10: 'J',
      11: 'K',
      12: 'L',
      13: 'M',
      14: 'N',
      15: 'O',
      16: 'P',
      17: 'Qu',
      18: 'R',
      19: 'S',
      20: 'T',
      21: 'U',
      22: 'V',
      23: 'W',
      24: 'X',
      25: 'Y',
      26: 'Z'
    };
    var dieValue = rollDie();
    $('.die-value').text(dieValue);
    
    function rollDie() {
      return LETTER_MAP[(Math.round(Math.random() * 25) + 1)];
    };

    $('.roll').on('click', function() {
      dieValue = rollDie;
      $('.die-value').text(dieValue);
    });
  });
});