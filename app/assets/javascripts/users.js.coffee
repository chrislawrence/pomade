$ ->
  data = {
    datasets: [
      {
        data: $('#chart').data('pomodoros')
      }
      ]
    }
  ctx = document.getElementById("chart").getContext("2d")
  chart = new Chart(ctx).Bar(data)
  

