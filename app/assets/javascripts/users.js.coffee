$ ->
  new Morris.Donut
    element: 'tag-chart'
    data: $('#tag-chart').data('tags')
    colors: ['#718CA6', '#566171', '#CE8A8A']
  new Morris.Area
    element: 'pomodoro-chart'
    data: $('#pomodoro-chart').data('pomodoros')
    xkey: 'label'
    ykeys: ['count']
    lineColors: ["#ABC3DA"]
    labels: ["Pomodoros"]
    xLabelFormat: (d)-> 
      monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
      monthNames[d.getMonth()] + " " + d.getDate()
