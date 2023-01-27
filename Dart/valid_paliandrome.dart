class Solution {
  bool isPalindrome(String s) {
    String filteredString = s
        .replaceAll(RegExp(r'[^A-Za-z0-9]'), '')
        .toLowerCase()
        .replaceAll(' ', '');
    ;

    int nString = filteredString.length;
    for (var i = 0; i < nString ~/ 2; i++) {
      if (filteredString[i] != filteredString[nString - (1 + i)]) return false;
    }

    return true;
  }

  bool isPalindromeByCopilot(String s) {
    String filteredString =
        s.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toLowerCase();

    return filteredString == filteredString.split('').reversed.join('');
  }
}

void main(List<String> args) {
  Map testCase = {
    1: {
      'input': "A man, a plan, a canal: Panama",
      'expected': true,
    },
    2: {
      'input': "race a car",
      'expected': false,
    },
    3: {
      'input': " ",
      'expected': true,
    },
  };

  testCase.forEach((key, value) {
    print('--> Test case: $key');
    print('Input: ${value['input']}');
    print('expected: ${value['expected']}');
    print('Output: ${Solution().isPalindromeByCopilot(value['input'])}');
  });
}
