$ ->
  new Morris.Donut
    element: 'tag-chart'
    data: $('#tag-chart').data('tags')
    colors: ['#718CA6', '#566171', '#CE8A8A']
    labelColor: '#444'
    fontWeight: 200
  new Morris.Area
    element: 'pomodoro-chart'
    data: $('#pomodoro-chart').data('pomodoros')
    xkey: 'label'
    ykeys: ['count']
    lineColors: ["#ABC3DA"]
    labels: ["Pomodoros"]
    gridTextFamily: 'inherit'
    labelTextFamily: 'inherit'
    xLabelFormat: (d)-> 
      monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
      monthNames[d.getMonth()] + " " + d.getDate()
