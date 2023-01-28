class Solution {
  int maxProfitBruteForce(List<int> prices) {
    int profit = 0;

    for (var i = 0; i < prices.length; i++) {
      for (var j = i + 1; j < prices.length; j++) {
        int sum = prices[j] - prices[i];
        if (sum < 0)
          continue;
        else if (profit > sum) continue;

        profit = sum;
      }
    }

    return profit;
  }

  int maxProfit(List<int> prices) {
    int maxProfit = 0;
    int min = prices[0];

    for (var i = 1; i < prices.length; i++) {
      if (min > prices[i]) {
        min = prices[i];
        continue;
      }
      int sum = prices[i] - min;
      if (sum > maxProfit) {
        maxProfit = sum;
      }
    }
    return maxProfit;
  }
}

void main(List<String> args) {
  Map testCase = {
    1: {
      'input': [7, 1, 5, 3, 6, 4],
      'expected': 5,
    },
    2: {
      'input': [7, 6, 4, 3, 1],
      'expected': 0,
    },
    3: {
      'input': [1, 2],
      'expected': 1,
    },
  };

  testCase.forEach((key, value) {
    print('--> Test case: $key');
    print('Input: ${value['input']}');
    print('expected: ${value['expected']}');
    print('Output: ${Solution().maxProfit(value['input'])}');
  });
}
