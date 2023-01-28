class Solution {
  List<int> twoSum(List<int> nums, int target) {
    for (var i = 0; i < nums.length; i++) {
      for (var j = (i + 1); j < nums.length; j++) {
        if (nums[i] + nums[j] == target) {
          return [i, j];
        }
      }
    }

    return nums;
  }

  List<int> twoSumOptimized(List<int> nums, int target) {
    for (var i = 0; i < nums.length; i++) {
      int complement = target - nums[i];
      if (nums.indexOf(complement) != -1 && nums.indexOf(complement) != i) {
        return [i, nums.indexOf(complement)];
      }
    }
    return nums;
  }

  List<int> twoSumUsingMap(List<int> nums, int target) {
    Map<int, int> map = {};

    for (var i = 0; i < nums.length; i++) {
      int complement = target - nums[i];
      if (map.containsKey(complement)) {
        return [map[complement]!, i];
      }
      map[nums[i]] = i;
    }
    return nums;
  }
}

void main(List<String> args) {
  final objTwoSum = Solution();

  // create groub of test cases
  Map<String, dynamic> testCase = {
    'test1': {
      'input': [4, 7, 4, 15],
      'target': 8,
      'output': [0, 2]
    },
    'test2': {
      'input': [3, 2, 4],
      'target': 6,
      'output': [1, 2]
    },
    'test3': {
      'input': [3, 3],
      'target': 6,
      'output': [0, 1]
    },
  };

  testCase.forEach((key, value) {
    print('Test Case: $key');
    print('Input: ${value['input']}');
    print('Target: ${value['target']}');
    print(
        'Output: ${objTwoSum.twoSumUsingMap(value['input'], value['target'])}');
    print('Expected: ${value['output']}');
    print('-----------------------');
  });
}
