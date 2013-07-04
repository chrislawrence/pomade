$ ->

  CanvasJS.addColorSet "pomadeColours",
    [
      "#ccc"
    ]

  chart = new CanvasJS.Chart "pomodoros",
    data:[ 
      type: "column"
      color: "#90B9E3" 
      dataPoints:
        $('#pomodoros').data('pomodoros')  
    ]
    backgroundColor: '#EFF4F9'
    axisX:
      gridColor: '#D1D6DB'
      lineColor: '#8E99A3'
      tickColor: '#8E99A3'
    axisY:
      gridColor: '#E7E9EC'
      lineColor: '#8E99A3'
      tickColor: '#8E99A3'
  chart.render()
