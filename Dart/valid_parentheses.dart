class Solution {
  bool isBalace(String sentence) {
    List<String> stack = [];

    for (var i = 0; i < sentence.length; i++) {
      String char = sentence[i];

      if (char != ')' && char != '}' && char != ']') {
        stack.add(char);
      } else {
        if (stack.isEmpty) return false;

        switch (char) {
          case ')':
            if (stack.last != '(') return false;
            break;
          case '}':
            if (stack.last != '{') return false;
            break;
          case ']':
            if (stack.last != '[') return false;
            break;
          default:
        }
        stack.removeLast();
      }
    }
    return stack.isEmpty;
  }

  bool isValidByCopilot(String s) {
    Map<String, String> map = {
      '(': ')',
      '{': '}',
      '[': ']',
    };

    List<String> stack = [];

    for (var i = 0; i < s.length; i++) {
      String char = s[i];

      if (map.containsKey(char)) {
        stack.add(char);
      } else {
        if (stack.isEmpty) return false;

        String last = stack.last;

        if (char != map[last]) return false;

        stack.removeLast();
      }
    }
    return stack.isEmpty;
  }
}

void main(List<String> args) {
  final model = Solution();

  // create groub of test cases
  Map<String, dynamic> testCase = {
    '1': {
      'input': "()",
      'target': true,
    },
    '2': {
      'input': "()[]{}",
      'target': true,
    },
    '3': {
      'input': "(]",
      'target': false,
    },
  };

  testCase.forEach((key, value) {
    print('Test Case: $key');
    print('Input: ${value['input']}');
    print('Target: ${value['target']}');
    print('--> Output: ${model.isBalace(value['input'])}');
  });
}
