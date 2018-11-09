function nextDate(date, array) {
  var targetDate = new Date(date)
  var array = array.map(string => new Date(string))
  var nextDate = array.find(function(date) { return date>targetDate });
  var dayDivisor = (1000*60*60*24);
  return Math.floor((nextDate - targetDate)/dayDivisor) || 7
}

function updateNightsAvailable(date, array) {
  for (var i=1; i<8; i++) {
    $(`#nights option[value=${i}]`).show();
  };
  var days = nextDate(date, array)
  if (days < 7) {
    for (var i=days+1; i<8; i++) {
      $(`#nights option[value=${i}]`).hide();
    };
  };
};
