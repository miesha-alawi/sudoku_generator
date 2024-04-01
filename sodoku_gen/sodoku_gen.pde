ArrayList<Integer> numbers = new ArrayList<Integer>();
int scale = 44;

void setup() {
  size(400, 400);
  fillGrid();
  for (int i = 1; i < 10; i++) {
    numbers.add(i);
  }
  gen();
}

void mousePressed() {
  fillGrid();
  for (int i = 1; i < 10; i++) {
    numbers.add(i);
  }
  gen();
}


void draw() {
  background(255);
  gridDraw();
}

boolean solve(int[][] grid, int r, int c) {
  boolean verdict = false;
  if (r == rows-1 && c == cols) {
    return true;
  }
  if (c == cols) {
    r++;
    c = 0;
  }
  if (grid[c][r] > 0) {
    return solve(grid, r, c+1);
  }

  for (int n = 1; n < 10; n++) {
    if (isvalid(grid, c, r, n)) {
      grid[c][r] = n;
      if (solve(grid, r, c+1)) {
        verdict = true;
      } else {
        grid[c][r] = 0;
        verdict = false;
      }
    }
  }
  return verdict;
}

boolean isvalid(int[][] g, int c, int r, int n) {
  if (!checkForNumInCol(n, c) && !checkForNumInRow(n, r) && grid[c][r] == 0 && !checkForNumInBox(n, c, r)) {
    return true;
  } else {
    return false;
  }
}

void gen() {
//  while (numbers.size() > 0) {
    //pick a random number from the numbers list
    int index = (int)random(0, numbers.size()-1);
    int n = numbers.get(index);
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (isvalid(grid, i, j, n)) {
          int[][] copy = grid.clone();
          copy[i][j] = n;
          if (solve(copy, 0, 0)) {
            grid = copy;
            println("done");
            numbers.remove(index);
          } else {
            index = (int)random(0, numbers.size()-1);
            n = numbers.get(index);
          }
        }
      }
    }
 // }
  if (!solve(grid, 0, 0)) {
    println("impossible");
  } else {
    println("possible");
  }
}
