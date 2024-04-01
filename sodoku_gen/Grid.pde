int cols = 9;
int rows = 9;
int[][]grid  = new int[cols][rows];

//fills list with unallowed values because int does not support null types
void fillGrid() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = 0;
    }
  }
}

boolean checkGrid() {
  boolean verdict = true;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (grid[i][j] == 0) {
        verdict = false;
      }
    }
  }
  return verdict;
}

boolean checkForNumInCol(int n, int c) {
  boolean verdict = false;
  for (int i = 0; i < cols; i++) {
    if (grid[c][i] == n) {
      verdict = true;
    }
  }
  return verdict;
}

boolean checkForNumInRow(int n, int r) {
  boolean verdict = false;
  for (int i = 0; i < rows; i++) {
    if (grid[i][r] ==  n) {
      verdict = true;
    }
  }
  return verdict;
}

boolean checkForNumInBox(int n, int c, int r) {
  boolean verdict = false;
  for (int i = c/3*3; i < c/3*3+3; i++) {
    for (int j = r/3*3; j < r/3*3+3; j++) {
      if (grid[i][j] == n) {
        verdict = true;
      }
    }
  }
  return verdict;
}



void gridDraw() {
  strokeWeight(1);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      noFill();
      stroke(0);
      rect(i*scale, j*scale, scale, scale);
      if (grid[i][j] != 0) {
        textSize(40);
        fill(0);
        text(grid[i][j], i*scale, j*scale+scale);
      }
    }
  }
  strokeWeight(3);
  line(0, 3*scale, 9*scale, 3*scale);
  line(0, 6*scale, 9*scale, 6*scale);
  line(3*scale, 0, 3*scale, 9*scale);
  line(6*scale, 0, 6*scale, 9*scale);
}
