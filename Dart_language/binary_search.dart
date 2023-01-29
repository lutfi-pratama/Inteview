class Solutions {
  // This is iterative approach
  int search(List<int> nums, int target) {
    int iLow = 0;
    int iHigh = nums.length - 1;

    while (iHigh - iLow > 1) {
      int mid = ((iHigh + iLow) / 2).floor();

      if (nums[mid] > target)
        iHigh = mid - 1;
      else
        iLow = mid;
    }

    if (nums[iLow] == target)
      return iLow;
    else if (nums[iHigh] == target)
      return iHigh;
    else
      return -1;
  }

  void runProgram() {
    Map testCase = {
      1: {
        'input1': [-1, 0, 3, 5, 9, 12],
        'input2': 9,
        'expected': 4,
      },
      2: {
        'input1': [-1, 0, 3, 5, 9, 12],
        'input2': 2,
        'expected': -1,
      },
      3: {
        'input1': [5],
        'input2': -5,
        'expected': -1,
      },
      4: {
        'input1': [2, 5],
        'input2': 5,
        'expected': 1,
      },
    };

    testCase.forEach((key, value) {
      print('--> Test case: $key');
      print('Input: ${value['input1']}');
      print('Target: ${value['input2']}');
      print('expected: ${value['expected']}');
      print('Output: ${search(value['input1'], value['input2'])}');
    });
  }
}

void main(List<String> args) {
  Solutions().runProgram();
}
