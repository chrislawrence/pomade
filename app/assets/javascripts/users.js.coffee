$ ->
  $('#pomodoros').highcharts
    chart:
      type: 'bar'
    title:
      text: 'Pomodoros by day'
    yAxis:
      title:
        text: 'Pomodoros'
    xAxis:
      title:
        text: 'Day'
    series:
      name: 'Pomodoros by day'
      data: $('#pomodoros').data('pomodoros')
