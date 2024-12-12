PGraphics grid, edge, corner, rulers;

void insectaGrid () {
  grid.beginDraw();
  for (int x = 0; x < gridSize; x++) {
    for (int y = 0; y < gridSize; y++) {
      grid.stroke(200);
      grid.fill(255);
      grid.square(x*tileSize, y*tileSize, tileSize);
    }
  }
  grid.endDraw();
}

void insectaEdge () {
  edge.beginDraw();
  edge.fill(0);
  edge.noStroke();
  edge.triangle(0.4, tileSize, tileSize, tileSize, tileSize, 0.4);
  edge.triangle(tileSize, tileSize, tileSize*2-0.4, tileSize, tileSize, tileSize*2-0.4);
  edge.fill(255);
  edge.stroke(255);
  edge.arc(-1, -1, tileSize*2, tileSize*2, 0, HALF_PI, CHORD);
  edge.arc(tileSize*2+1, tileSize*2+1, tileSize*2+1, tileSize*2+1, HALF_PI*2, HALF_PI*3, CHORD);
  edge.noStroke();
  edge.circle(tileSize, tileSize, int(tileSize)/2);
  edge.endDraw();
}

void insectaCorner () {
  corner.beginDraw();
  corner.fill(0);
  corner.noStroke();
  corner.triangle(0, 0, 0, tileSize, tileSize, 0);
  corner.fill(255);
  corner.stroke(255);
  corner.arc(tileSize, tileSize, tileSize*2, tileSize*2, HALF_PI * 2, HALF_PI*3);
  corner.endDraw();
}

void insectaRulers () {
  rulers.beginDraw();
  rulers.stroke(#FF0000);
  rulers.line(0, tileSize*4, width, tileSize*4);
  rulers.line(0, tileSize*11, width, tileSize*11);
  rulers.stroke(#0000FF);
  rulers.line(0, tileSize*2, width, tileSize*2);
  rulers.line(0, tileSize*7, width, tileSize*7);
  rulers.endDraw();
}
