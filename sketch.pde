/*
Danubi - Random logo generator
Copyright (C) 2016-2018 Vito Latrofa (pitouproject.it)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

void setup() {
  size(200, 200);
  smooth();
}

void draw()
{
  int headStrokeColor = color(random(0, 255), random(0, 255), random(0, 255));
  int headFillColor = #ffffff;
  int bodyStrokeColor = headStrokeColor;
  int bodyFillColor = color(random(0, 255), random(0, 255), random(0, 255));
  int wingsStrokeColor = bodyStrokeColor;
  int wingsFillColor = bodyFillColor;
  int diagonalFillColor = #ffffff;
  int diagonalStrokeColor = color(random(0, 255), random(0, 255), random(0, 255));
  int eyesColor = 0;

  background(diagonalFillColor);

  HashMap <String, Integer> colors = new HashMap <String, Integer> ();
  colors.put("diagonals.stroke", diagonalStrokeColor);
  colors.put("diagonals.fill", diagonalFillColor);
  colors.put("body.stroke", bodyStrokeColor);
  colors.put("body.fill", bodyFillColor);
  colors.put("head.stroke", headStrokeColor);
  colors.put("head.fill", headFillColor);
  colors.put("wings.stroke", wingsStrokeColor);
  colors.put("wings.fill", wingsFillColor);
  colors.put("mouth.stroke", headStrokeColor);
  colors.put("mouth.fill", bodyFillColor);
  colors.put("eyes.stroke", eyesColor);
  colors.put("fullbody.stroke", headStrokeColor);
  colors.put("fullbody.fill", bodyFillColor);

  int type = round(random(0, 1));

  int leftMargin = 0;
  int topMargin = 0;

  if (type == 0) {
    figureWithWings(leftMargin, topMargin, 8, colors);
  } else {
    figureFullBody(leftMargin, topMargin, 8, colors);
  }

  noLoop();
}

void reload(){
  background(255);
  loop();
}

void mouseReleased(){
  reload();
}

void figureFullBody(float leftMargin, float topMargin, float gap, HashMap <String, Integer> colors) {

  float m = width / 100;
  float g = 300;

  diagonalLinesBackground(m, -(g * 2) * m, -(g * 2) * m, g * 4 * m, g * 4 * m, gap * m, colors.get("diagonals.stroke"));

  head(m, leftMargin, topMargin, colors.get("head.stroke"), colors.get("head.fill"));

  body(m, leftMargin, topMargin, colors.get("body.stroke"), colors.get("body.fill"));

  mouth(m, leftMargin, topMargin, colors.get("mouth.stroke"), colors.get("mouth.fill"));

  wings(m, leftMargin, topMargin, colors.get("wings.stroke"), colors.get("wings.fill"));

  eyes(m, leftMargin, topMargin, colors.get("eyes.stroke"));
}

void figureWithWings(float leftMargin, float topMargin, float gap, HashMap <String, Integer> colors) {

  float m = width / 100;
  float g = 300;

  diagonalLinesBackground(m, -(g * 2) * m, -(g * 2) * m, g * 4 * m, g * 4 * m, gap * m, colors.get("diagonals.stroke"));

  head(m, leftMargin, topMargin, colors.get("head.stroke"), colors.get("head.fill"));

  fullBody(m, leftMargin, topMargin, colors.get("fullbody.stroke"), colors.get("fullbody.fill"));

  eyes(m, leftMargin, topMargin, colors.get("eyes.stroke"));
}

void head(float m, float leftMargin, float topMargin, color strokeColor, color fillColor) {

  strokeWeight(3 * m);
  stroke(strokeColor);
  fill(fillColor);

  beginShape();
  vertex((leftMargin + 50) * m,   (topMargin + 65) * m);  // 1
  vertex((leftMargin + 22.5) * m, (topMargin + 50) * m);  // 2
  vertex((leftMargin + 35) * m,   (topMargin + 10) * m);  // 3
  vertex((leftMargin + 50) * m,   (topMargin + 25) * m);  // 4
  vertex((leftMargin + 65) * m,   (topMargin + 10) * m);  // 5
  vertex((leftMargin + 77.5) * m, (topMargin + 50) * m);  // 6
  vertex((leftMargin + 50) * m,   (topMargin + 65) * m);  // 7
  endShape();
}

void body(float m, float leftMargin, float topMargin, color strokeColor, color fillColor) {

  strokeWeight(3 * m);
  stroke(strokeColor);
  fill(fillColor);

  beginShape();
  vertex((leftMargin + 7.5) * m,  (topMargin + 75) * m);
  vertex((leftMargin + 20) * m,   (topMargin + 50) * m);
  vertex((leftMargin + 50) * m,   (topMargin + 60) * m);
  vertex((leftMargin + 80) * m,   (topMargin + 50) * m);
  vertex((leftMargin + 92.5) * m, (topMargin + 75) * m);
  vertex((leftMargin + 50) * m,   (topMargin + 80) * m);
  vertex((leftMargin + 7.5) * m,  (topMargin + 75) * m);
  endShape();
}

void mouth(float m, float leftMargin, float topMargin, color strokeColor, color fillColor) {

  strokeWeight(3 * m);
  stroke(strokeColor);
  fill(fillColor);

  beginShape();
  vertex((leftMargin + 50) * m,   (topMargin + 47.5) * m);
  vertex((leftMargin + 25) * m,   (topMargin + 60) * m);
  vertex((leftMargin + 75) * m,   (topMargin + 60) * m);
  vertex((leftMargin + 50) * m,   (topMargin + 47.5) * m);
  endShape();
}

void wings(float m, float leftMargin, float topMargin, color strokeColor, color fillColor) {

  strokeWeight(3 * m);
  stroke(strokeColor);
  fill(fillColor);

  beginShape();
  vertex((leftMargin + 95) * m,   (topMargin + 35) * m);
  vertex((leftMargin + 50) * m,   (topMargin + 60) * m);
  vertex((leftMargin + 5) * m,    (topMargin + 35) * m);
  vertex((leftMargin + 30) * m,   (topMargin + 90) * m);
  vertex((leftMargin + 50) * m,   (topMargin + 82.5) * m);
  vertex((leftMargin + 70) * m,   (topMargin + 90) * m);
  vertex((leftMargin + 95) * m,   (topMargin + 35) * m);
  endShape();
}

void eyes(float m, float leftMargin, float topMargin, color strokeColor) {

  strokeWeight(2 * m);
  stroke(strokeColor);

  line((leftMargin + 35) * m,     (topMargin + 25) * m,   (leftMargin + 42.5) * m, (topMargin + 40) * m);
  line((leftMargin + 57.5) * m,   (topMargin + 40) * m,   (leftMargin + 65) * m,   (topMargin + 25) * m);
}

void fullBody(float m, float leftMargin, float topMargin, color strokeColor, color fillColor) {

  strokeWeight(3 * m);
  stroke(strokeColor);
  fill(fillColor);

  beginShape();
  vertex((leftMargin + 50) * m,   (topMargin + 47.5) * m);
  vertex((leftMargin + 62.5) * m, (topMargin + 52.5) * m);
  vertex((leftMargin + 95) * m,   (topMargin + 35) * m);
  vertex((leftMargin + 85) * m,   (topMargin + 60) * m);
  vertex((leftMargin + 92.5) * m, (topMargin + 75) * m);
  vertex((leftMargin + 77.5) * m, (topMargin + 77.5) * m);
  vertex((leftMargin + 70) * m,   (topMargin + 90) * m);

  vertex((leftMargin + 50) * m,   (topMargin + 82.5) * m);
  vertex((leftMargin + 30) * m,   (topMargin + 90) * m);
  vertex((leftMargin + 22.5) * m, (topMargin + 77.5) * m);
  vertex((leftMargin + 7.5) * m,  (topMargin + 75) * m);
  vertex((leftMargin + 15) * m,   (topMargin + 60) * m);
  vertex((leftMargin + 5) * m,    (topMargin + 35) * m);
  vertex((leftMargin + 37.5) * m, (topMargin + 52.5) * m);
  
  vertex((leftMargin + 50) * m,   (topMargin + 47.5) * m);
  endShape();
}

void diagonalLinesBackground(float m, float x1, float y1, float w, float h, float gap, color linesColor) {

  strokeWeight(2 * m);
  stroke(linesColor);

  float lx_bottom = x1 - (gap - gap/4) + (gap - gap/2) + (gap + gap/4);

  for (float x = lx_bottom, y = y1+4; x <= x1+w; x += (gap + gap/4), y += (gap + gap/4)) {
    lx_bottom += (gap + gap/4);
    line(x, y1+h, x1+w, y);
  }
}
