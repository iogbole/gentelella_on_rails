ready = ->

  gd = (year, month, day) ->
    new Date(year, month - 1, day).getTime()
    
  data1 = [
    [
      gd(2012, 1, 1)
      17
    ]
    [
      gd(2012, 1, 2)
      74
    ]
    [
      gd(2012, 1, 3)
      6
    ]
    [
      gd(2012, 1, 4)
      39
    ]
    [
      gd(2012, 1, 5)
      20
    ]
    [
      gd(2012, 1, 6)
      85
    ]
    [
      gd(2012, 1, 7)
      7
    ]
  ]
  data2 = [
    [
      gd(2012, 1, 1)
      82
    ]
    [
      gd(2012, 1, 2)
      23
    ]
    [
      gd(2012, 1, 3)
      66
    ]
    [
      gd(2012, 1, 4)
      9
    ]
    [
      gd(2012, 1, 5)
      119
    ]
    [
      gd(2012, 1, 6)
      6
    ]
    [
      gd(2012, 1, 7)
      9
    ]
  ]

 

  $('#canvas_dahs').length and $.plot($('#canvas_dahs'), [
    data1
    data2
  ],
    series:
      lines:
        show: false
        fill: true
      splines:
        show: true
        tension: 0.4
        lineWidth: 1
        fill: 0.4
      points:
        radius: 0
        show: true
      shadowSize: 2
    grid:
      verticalLines: true
      hoverable: true
      clickable: true
      tickColor: '#d5d5d5'
      borderWidth: 1
      color: '#fff'
    colors: [
      'rgba(38, 185, 154, 0.38)'
      'rgba(3, 88, 106, 0.38)'
    ]
    xaxis:
      tickColor: 'rgba(51, 51, 51, 0.06)'
      mode: 'time'
      tickSize: [
        1
        'day'
      ]
      axisLabel: 'Date'
      axisLabelUseCanvas: true
      axisLabelFontSizePixels: 12
      axisLabelFontFamily: 'Verdana, Arial'
      axisLabelPadding: 10
    yaxis:
      ticks: 8
      tickColor: 'rgba(51, 51, 51, 0.06)'
    tooltip: false)

# /Flot

# JQVMap

  $('#world-map-gdp').vectorMap
    map: 'world_en'
    backgroundColor: null
    color: '#ffffff'
    hoverOpacity: 0.7
    selectedColor: '#666666'
    enableZoom: true
    showTooltip: true
    values: sample_data
    scaleColors: [
      '#E6F2F0'
      '#149B7E'
    ]
    normalizeFunction: 'polynomial'

# /JQVMap

# Skycons

  icons = new Skycons('color': '#73879C')
  list = [
    'clear-day'
    'clear-night'
    'partly-cloudy-day'
    'partly-cloudy-night'
    'cloudy'
    'rain'
    'sleet'
    'snow'
    'wind'
    'fog'
  ]
  i = undefined
  i = list.length
  while i--
    icons.set list[i], list[i]
  icons.play()
  # /Skycons

  # Doughnut Chart
  options =
    legend: false
    responsive: false
  new Chart(document.getElementById('canvas1'),
    type: 'doughnut'
    tooltipFillColor: 'rgba(51, 51, 51, 0.55)'
    data:
      labels: [
        'Symbian'
        'Blackberry'
        'Other'
        'Android'
        'IOS'
      ]
      datasets: [ {
        data: [
          15
          20
          30
          10
          30
        ]
        backgroundColor: [
          '#BDC3C7'
          '#9B59B6'
          '#E74C3C'
          '#26B99A'
          '#3498DB'
        ]
        hoverBackgroundColor: [
          '#CFD4D8'
          '#B370CF'
          '#E95E4F'
          '#36CAAB'
          '#49A9EA'
        ]
      } ]
    options: options)
  # /Doughnut Chart

  # bootstrap-daterangepicker

  cb = (start, end, label) ->
    console.log start.toISOString(), end.toISOString(), label
    $('#reportrange span').html start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY')

  optionSet1 = 
    startDate: moment().subtract(29, 'days')
    endDate: moment()
    minDate: '01/01/2012'
    maxDate: '12/31/2015'
    dateLimit: days: 60
    showDropdowns: true
    showWeekNumbers: true
    timePicker: false
    timePickerIncrement: 1
    timePicker12Hour: true
    ranges:
      'Today': [
        moment()
        moment()
      ]
      'Yesterday': [
        moment().subtract(1, 'days')
        moment().subtract(1, 'days')
      ]
      'Last 7 Days': [
        moment().subtract(6, 'days')
        moment()
      ]
      'Last 30 Days': [
        moment().subtract(29, 'days')
        moment()
      ]
      'This Month': [
        moment().startOf('month')
        moment().endOf('month')
      ]
      'Last Month': [
        moment().subtract(1, 'month').startOf('month')
        moment().subtract(1, 'month').endOf('month')
      ]
    opens: 'left'
    buttonClasses: [ 'btn btn-default' ]
    applyClass: 'btn-small btn-primary'
    cancelClass: 'btn-small'
    format: 'MM/DD/YYYY'
    separator: ' to '
    locale:
      applyLabel: 'Submit'
      cancelLabel: 'Clear'
      fromLabel: 'From'
      toLabel: 'To'
      customRangeLabel: 'Custom'
      daysOfWeek: [
        'Su'
        'Mo'
        'Tu'
        'We'
        'Th'
        'Fr'
        'Sa'
      ]
      monthNames: [
        'January'
        'February'
        'March'
        'April'
        'May'
        'June'
        'July'
        'August'
        'September'
        'October'
        'November'
        'December'
      ]
      firstDay: 1
  $('#reportrange span').html moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY')
  $('#reportrange').daterangepicker optionSet1, cb
  $('#reportrange').on 'show.daterangepicker', ->
    console.log 'show event fired'
  $('#reportrange').on 'hide.daterangepicker', ->
    console.log 'hide event fired'
  $('#reportrange').on 'apply.daterangepicker', (ev, picker) ->
    console.log 'apply event fired, start/end dates are ' + picker.startDate.format('MMMM D, YYYY') + ' to ' + picker.endDate.format('MMMM D, YYYY')
  $('#reportrange').on 'cancel.daterangepicker', (ev, picker) ->
    console.log 'cancel event fired'
  $('#options1').click ->
    $('#reportrange').data('daterangepicker').setOptions optionSet1, cb
  $('#options2').click ->
    $('#reportrange').data('daterangepicker').setOptions optionSet2, cb
  $('#destroy').click ->
    $('#reportrange').data('daterangepicker').remove()
  # /bootstrap-daterangepicker

  # gauge.js
  opts = 
    lines: 12
    angle: 0
    lineWidth: 0.4
    pointer:
      length: 0.75
      strokeWidth: 0.042
      color: '#1D212A'
    limitMax: 'false'
    colorStart: '#1ABC9C'
    colorStop: '#1ABC9C'
    strokeColor: '#F0F3F3'
    generateGradient: true
  target = document.getElementById('foo')
  gauge = new Gauge(target).setOptions(opts)
  gauge.maxValue = 6000
  gauge.animationSpeed = 32
  gauge.set 3200
  gauge.setTextField document.getElementById('gauge-text')
  # /gauge.js



#$(document).ready(ready)
$(document).on('turbolinks:load', ready)
