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
      fillColor : "rgba(151,187,205,0.5)",
      strokeColor : "rgba(151,187,205,1)",
      pointColor : "rgba(151,187,205,1)",
      pointStrokeColor : "#fff",
    ]
  options = {
    scaleOverride: true
    scaleSteps: scale
    scaleStepWidth: 1
    scaleStartValue: 0
    }
  chart = new Chart(ctx).Line(data, options)
