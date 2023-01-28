//  Definition for singly-linked list.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class LinkedList {
  ListNode head;
  LinkedList(this.head);
}

class Solutions {
  bool validAnagram(String s, String t) {
    final sortedS = s.split('')..sort();
    final sortedT = t.split('')..sort();

    if (sortedS.length != sortedT.length) return false;

    for (var i = 0; i < sortedS.length; i++) {
      if (sortedS[i] != sortedT[i]) return false;
    }

    return true;
  }

  bool validAnagramCopilot(String s, String t) {
    if (s.length != t.length) return false;

    Map<String, int> map = {};

    for (var i = 0; i < s.length; i++) {
      map[s[i]] = (map[s[i]] ?? 0) + 1;
      map[t[i]] = (map[t[i]] ?? 0) - 1;
    }

    for (var value in map.values) {
      if (value != 0) return false;
    }

    return true;
  }

  void runProgram() {
    Map testCase = {
      1: {
        'input1': 'anagram',
        'input2': 'nagaram',
        'expected': true,
      },
      2: {
        'input1': 'rat',
        'input2': 'car',
        'expected': false,
      },
      3: {
        'input1': 'aacc',
        'input2': 'cacc',
        'expected': false,
      },
    };

    testCase.forEach((key, value) {
      print('--> Test case: $key');
      print('Input: ${value['input']}');
      print('expected: ${value['expected']}');
      print('Output: ${validAnagram(value['input1'], value['input2'])}');
    });
  }
}

void main(List<String> args) {
  Solutions().runProgram();
}
