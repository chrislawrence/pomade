Pomade.TimerView = Ember.View.extend
  didInsertElement: ->
    $('.dial').knob({
      width: 300
      height: 300
      thickness: 0.1
      angleOffset: 180 + 40 # (360 - angleArc) / 2
      angleArc: 280
      displayInput: false
      fgColor: '94CBB4'
      bgColor: '292E33'
    })
