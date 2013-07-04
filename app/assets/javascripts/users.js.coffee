$ ->
  chart = new CanvasJS.Chart "pomodoros",
    title:
      text: "Pomodoros by day"
    data:[ 
      type: "column"
      dataPoints:
        $('#pomodoros').data('pomodoros')  
    ]
  chart.render()
