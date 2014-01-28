$(document).ready( ->
  canvas = document.getElementById('progress_circle')
  if canvas.getContext
    ctx = canvas.getContext('2d')
    ctx.arc(125,125,100,0 + 0.5,Math.PI - 0.5,true)
    ctx.lineWidth = 15
    ctx.stroke()
)

