class Solution {
  int longestPalindrome(String s) {
    Map<String, int> counter = {};
    var chars = s.split('');

    for (var char in chars) {
      if (counter.containsKey(char)) {
        counter[char] = counter[char]! + 1;
      } else {
        counter[char] = 1;
      }
    }

    int result = 0;
    for (var key in counter.keys) {
      result += (counter[key]! ~/ 2) * 2;

      if (result % 2 == 0 && counter[key]! % 2 == 1) {
        result += 1;
      }
    }

    return result;
  }

  int longestPaliandromeUsingSet(String s) {
    Set<String> set = {};
    List chars = s.split('');

    for (var char in chars) {
      if (set.contains(char)) {
        set.remove(char);
      } else {
        set.add(char);
      }
    }

    return chars.length - (set.length > 0 ? set.length - 1 : 0);
  }

  void runProgram() {
    Map testCase = {
      1: {
        'input': 'abccccdd',
        'expected': 7,
      },
      2: {
        'input': 'a',
        'expected': 1,
      },
    };

    testCase.forEach((key, value) {
      print('--> Test case: $key');
      print('Input: ${value['input']}');
      print('expected: ${value['expected']}');
      print('Output: ${longestPaliandromeUsingSet(value['input'])}');
    });
  }
}

void main(List<String> args) {
  Solution().runProgram();
}
