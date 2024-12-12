// A tool to brainstorm letterforms for a typeface. 

// The amount of squares in a row/column of the grid
float gridSize = 13;
// The size of a single square in the grid
float tileSize = 800/gridSize;
// Variables used in creating the drawing
int x, y;
float startX, startY;

void setup () {
  size(800, 800);
  background(255);

  //------------------- Controllers
  gui();

  //------------------- Grid
  grid = createGraphics(width, height);
  insectaGrid();
  image(grid, 0, 0);

  //------------------- Rulers
  rulers = createGraphics(width, height);
  insectaRulers();
  image(rulers, 0, 0);

  //------------------- Edges and Corners
  edge = createGraphics(125, 125);
  insectaEdge();
  corner = createGraphics(125, 125);
  insectaCorner();
}

void draw () {

  //------------------- Main drawing
  if (mousePressed) {
    for (x = 1; x < gridSize-1; x++) {
      for (y = 0; y < gridSize; y++) {
        startX = tileSize*x;
        startY = tileSize*y;
        if ( mouseX > startX && mouseX < startX + tileSize && mouseY > startY  && mouseY < startY + tileSize) {
          fill(0);
          stroke(0);
          square(startX, startY, tileSize);
          drawEdgeAndCorners ();
        }
      }
    }
  }
}

void drawEdgeAndCorners () {

  //------------------- Getting the color of the neighbouring tiles
  color pixelColorL = get((int(mouseX - tileSize)), (int(mouseY)));
  color pixelColorR = get((int(mouseX + tileSize)), (int(mouseY)));
  color pixelColorU = get((int(mouseX)), (int(mouseY - tileSize)));
  color pixelColorD = get((int(mouseX)), (int(mouseY + tileSize)));
  color pixelColorRU = get((int(mouseX + tileSize)), (int(mouseY - tileSize)));
  color pixelColorLD = get((int(mouseX - tileSize)), (int(mouseY + tileSize)));

  // ------------------- Draw Edge, Direction : vertical, down, left
  if (pixelColorU == color(255) &&  pixelColorR == color(255) && pixelColorRU == color(0)) {
    image(edge, startX, startY - tileSize);
  }
  // ------------------- Draw Edge, Direction : vertical, up, right
  if (pixelColorL == color(255) && pixelColorD == color(255) && pixelColorLD == color(0)) {
    image(edge, startX - tileSize, startY);
  }
  // ------------------- Draw Corner, Direction : up, right
  if (pixelColorL == color(0) && pixelColorD == color(255) && pixelColorLD == color(0)) {
    image(corner, startX, startY + tileSize);
  }
  // ------------------- Draw Corner, Direction : left, down
  if (pixelColorR == color(255) && pixelColorU == color(0) && pixelColorRU == color(0)) {
    image(corner, startX + tileSize, startY);
  }
}

//------------------- Clear Button
void clear () {
  image(grid, 0, 0);
  image(rulers, 0, 0);
}

//------------------- Save Button
void save () {
  saveFrame("insecta-###.jpg");
}
