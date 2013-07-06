$ ->
  ctx = document.getElementById("pomodoro_chart").getContext("2d")
  pomodoro_data = $('#pomodoro_chart').data('pomodoros')
  counts = new Array()
  $.map(pomodoro_data, (n) -> counts.push(n.count))
  scale = Math.max.apply(Math, counts)
  data =
    labels : $.map(pomodoro_data, (n) -> n.label)
    datasets : [
      data : $.map(pomodoro_data, (n) -> n.count)
      fillColor : "#C6DAEE"
      strokeColor : "#BCD0E3" 
      pointColor : "#AFD4F7"
      pointStrokeColor : "#fff",
    ]
  options = {
    scaleOverride: true
    scaleSteps: scale
    scaleStepWidth: 1
    scaleStartValue: 0
    scaleFontFamily: 'helvetica, arial, sans-serif'  
    scaleFontSize: 14
    scaleFontColor: '#444'
    scaleFontStyle: 'bold'
    datasetStrokeWidth: 7

  }
  chart = new Chart(ctx).Line(data, options)
