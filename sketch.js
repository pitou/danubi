function setup() {
  createCanvas(300, 300)
  smooth()
  noLoop()
}

function draw() {
  const black = '#000000'
  const white = '#ffffff'

  const headStrokeColor = color(random(0, 255), random(0, 255), random(0, 255))
  const headFillColor = white
  const bodyStrokeColor = headStrokeColor
  const bodyFillColor = color(random(0, 255), random(0, 255), random(0, 255))
  const wingsStrokeColor = bodyStrokeColor
  const wingsFillColor = bodyFillColor
  const diagonalFillColor = white
  const diagonalStrokeColor = color(
    random(0, 255),
    random(0, 255),
    random(0, 255)
  )
  const eyesColor = black

  background(diagonalFillColor)

  const colors = {}
  colors.diagonals = { stroke: diagonalStrokeColor, fill: diagonalFillColor }
  colors.body = { stroke: bodyStrokeColor, fill: bodyFillColor }
  colors.head = { stroke: headStrokeColor, fill: headFillColor }
  colors.wings = { stroke: wingsStrokeColor, fill: wingsFillColor }
  colors.mouth = { stroke: headStrokeColor, fill: bodyFillColor }
  colors.eyes = { stroke: eyesColor }
  colors.fullbody = { stroke: headStrokeColor, fill: bodyFillColor }

  const colorsBW = {}
  colorsBW.diagonals = { stroke: black, fill: white }
  colorsBW.body = { stroke: black, fill: black }
  colorsBW.head = { stroke: black, fill: white }
  colorsBW.wings = { stroke: black, fill: black }
  colorsBW.mouth = { stroke: black, fill: black }
  colorsBW.eyes = { stroke: black }
  colorsBW.fullbody = { stroke: white, fill: white }

  const type = round(random(0, 1))

  const leftMargin = 0
  const topMargin = 0

  switch (type) {
    case 0:
      figureWithWings(leftMargin, topMargin, 8, colors)
      break
    case 1:
      figureFullBody(leftMargin, topMargin, 8, colors)
      break
    case 2:
      figureFullBody(leftMargin, topMargin, 8, colorsBW)
      break
  }

  noLoop()
}

function reload() {
  background(255)
  loop()
}

function mouseReleased() {
  reload()
}

function figureFullBody(leftMargin, topMargin, gap, colors) {
  const m = width / 100
  const g = 300

  diagonalLinesBackground(
    m,
    -(g * 2) * m,
    -(g * 2) * m,
    g * 4 * m,
    g * 4 * m,
    gap * m,
    colors.diagonals.stroke
  )

  head(m, leftMargin, topMargin, colors.head.stroke, colors.head.fill)

  body(m, leftMargin, topMargin, colors.body.stroke, colors.body.fill)

  mouth(m, leftMargin, topMargin, colors.mouth.stroke, colors.mouth.fill)

  wings(m, leftMargin, topMargin, colors.wings.stroke, colors.wings.fill)

  eyes(m, leftMargin, topMargin, colors.eyes.stroke)
}

function figureWithWings(leftMargin, topMargin, gap, colors) {
  const m = width / 100
  const g = 300

  diagonalLinesBackground(
    m,
    -(g * 2) * m,
    -(g * 2) * m,
    g * 4 * m,
    g * 4 * m,
    gap * m,
    colors.diagonals.stroke
  )

  head(m, leftMargin, topMargin, colors.head.stroke, colors.head.fill)

  fullBody(
    m,
    leftMargin,
    topMargin,
    colors.fullbody.stroke,
    colors.fullbody.fill
  )

  eyes(m, leftMargin, topMargin, colors.eyes.stroke)
}

function head(m, leftMargin, topMargin, strokeColor, fillColor) {
  strokeWeight(3 * m)
  stroke(strokeColor)
  fill(fillColor)

  beginShape()
  vertex((leftMargin + 50) * m, (topMargin + 65) * m)
  vertex((leftMargin + 22.5) * m, (topMargin + 50) * m)
  vertex((leftMargin + 35) * m, (topMargin + 10) * m)
  vertex((leftMargin + 50) * m, (topMargin + 25) * m)
  vertex((leftMargin + 65) * m, (topMargin + 10) * m)
  vertex((leftMargin + 77.5) * m, (topMargin + 50) * m)
  vertex((leftMargin + 50) * m, (topMargin + 65) * m)
  endShape()
}

function body(m, leftMargin, topMargin, strokeColor, fillColor) {
  strokeWeight(3 * m)
  stroke(strokeColor)
  fill(fillColor)

  beginShape()
  vertex((leftMargin + 7.5) * m, (topMargin + 75) * m)
  vertex((leftMargin + 20) * m, (topMargin + 50) * m)
  vertex((leftMargin + 50) * m, (topMargin + 60) * m)
  vertex((leftMargin + 80) * m, (topMargin + 50) * m)
  vertex((leftMargin + 92.5) * m, (topMargin + 75) * m)
  vertex((leftMargin + 50) * m, (topMargin + 80) * m)
  vertex((leftMargin + 7.5) * m, (topMargin + 75) * m)
  endShape()
}

function mouth(m, leftMargin, topMargin, strokeColor, fillColor) {
  strokeWeight(3 * m)
  stroke(strokeColor)
  fill(fillColor)

  beginShape()
  vertex((leftMargin + 50) * m, (topMargin + 47.5) * m)
  vertex((leftMargin + 25) * m, (topMargin + 60) * m)
  vertex((leftMargin + 75) * m, (topMargin + 60) * m)
  vertex((leftMargin + 50) * m, (topMargin + 47.5) * m)
  endShape()
}

function wings(m, leftMargin, topMargin, strokeColor, fillColor) {
  strokeWeight(3 * m)
  stroke(strokeColor)
  fill(fillColor)

  beginShape()
  vertex((leftMargin + 95) * m, (topMargin + 35) * m)
  vertex((leftMargin + 50) * m, (topMargin + 60) * m)
  vertex((leftMargin + 5) * m, (topMargin + 35) * m)
  vertex((leftMargin + 30) * m, (topMargin + 90) * m)
  vertex((leftMargin + 50) * m, (topMargin + 82.5) * m)
  vertex((leftMargin + 70) * m, (topMargin + 90) * m)
  vertex((leftMargin + 95) * m, (topMargin + 35) * m)
  endShape()
}

function eyes(m, leftMargin, topMargin, strokeColor) {
  strokeWeight(2 * m)
  stroke(strokeColor)

  line(
    (leftMargin + 35) * m,
    (topMargin + 25) * m,
    (leftMargin + 42.5) * m,
    (topMargin + 40) * m
  )
  line(
    (leftMargin + 57.5) * m,
    (topMargin + 40) * m,
    (leftMargin + 65) * m,
    (topMargin + 25) * m
  )
}

function fullBody(m, leftMargin, topMargin, strokeColor, fillColor) {
  strokeWeight(3 * m)
  stroke(strokeColor)
  fill(fillColor)

  beginShape()
  vertex((leftMargin + 50) * m, (topMargin + 47.5) * m)
  vertex((leftMargin + 62.5) * m, (topMargin + 52.5) * m)
  vertex((leftMargin + 95) * m, (topMargin + 35) * m)
  vertex((leftMargin + 85) * m, (topMargin + 60) * m)
  vertex((leftMargin + 92.5) * m, (topMargin + 75) * m)
  vertex((leftMargin + 77.5) * m, (topMargin + 77.5) * m)
  vertex((leftMargin + 70) * m, (topMargin + 90) * m)

  vertex((leftMargin + 50) * m, (topMargin + 82.5) * m)
  vertex((leftMargin + 30) * m, (topMargin + 90) * m)
  vertex((leftMargin + 22.5) * m, (topMargin + 77.5) * m)
  vertex((leftMargin + 7.5) * m, (topMargin + 75) * m)
  vertex((leftMargin + 15) * m, (topMargin + 60) * m)
  vertex((leftMargin + 5) * m, (topMargin + 35) * m)
  vertex((leftMargin + 37.5) * m, (topMargin + 52.5) * m)

  vertex((leftMargin + 50) * m, (topMargin + 47.5) * m)
  endShape()
}

function diagonalLinesBackground(m, x1, y1, w, h, gap, linesColor) {
  strokeWeight(2 * m)
  stroke(linesColor)

  let lx_bottom = x1 - (gap - gap / 4) + (gap - gap / 2) + (gap + gap / 4)

  for (
    let x = lx_bottom, y = y1 + 4;
    x <= x1 + w;
    x += gap + gap / 4, y += gap + gap / 4
  ) {
    lx_bottom += gap + gap / 4
    line(x, y1 + h, x1 + w, y)
  }
}
