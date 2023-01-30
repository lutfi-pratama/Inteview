class Solutions {
  void dfs(List<List<int>> image, int sr, int sc, int R, int C, int sourceColor,
      int color) {
    if (sr < 0 || sr > R || sc < 0 || sc > C)
      return;
    else if (image[sr][sc] != sourceColor) return;

    image[sr][sc] = color;

    dfs(image, sr + 1, sc, R, C, sourceColor, color); // TOP
    dfs(image, sr, sc + 1, R, C, sourceColor, color); // RIGHT
    dfs(image, sr - 1, sc, R, C, sourceColor, color); // BOTTOM
    dfs(image, sr, sc - 1, R, C, sourceColor, color); // LEFT
  }

  List<List<int>> floodFill(List<List<int>> image, int sr, int sc, int color) {
    if (image[sr][sc] == color) return image;

    int row = image.length - 1;
    int column = image[0].length - 1;
    int sourceColor = image[sr][sc];

    dfs(image, sr, sc, row, column, sourceColor, color);

    return image;
  }

  void runProgram() {
    Map testCase = {
      1: {
        'image': [
          [1, 1, 1],
          [1, 1, 0],
          [1, 0, 1]
        ],
        'sr': 1,
        'sc': 1,
        'color': 2,
        'expected': [
          [2, 2, 2],
          [2, 2, 0],
          [2, 0, 1]
        ],
      },
      2: {
        'image': [
          [0, 0, 0],
          [0, 0, 0]
        ],
        'sr': 0,
        'sc': 0,
        'color': 0,
        'expected': [
          [0, 0, 0],
          [0, 0, 0]
        ],
      },
    };

    testCase.forEach((key, value) {
      print('--> Test case: $key');
      print('Image: ${value['image']}');
      print('Color: ${value['color']}');
      print('expected: ${value['expected']}');
      print(
          'Output: ${floodFill(value['image'], value['sr'], value['sc'], value['color'])}');
    });
  }
}

void main(List<String> args) {
  Solutions().runProgram();
}
