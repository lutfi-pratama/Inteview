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
  ListNode? mergeTwoLists(ListNode? l1, ListNode? l2) {
    ListNode? head = ListNode();
    ListNode? current = head;

    while (l1 != null && l2 != null) {
      if (l1.val < l2.val) {
        current!.next = l1;
        l1 = l1.next;
      } else {
        current!.next = l2;
        l2 = l2.next;
      }
      current = current.next;
    }

    if (l1 != null) {
      current!.next = l1;
    } else {
      current!.next = l2;
    }

    return head.next;
  }

  void runProgram() {
    Map testCase = {
      1: {
        'input1': ListNode(1, ListNode(2, ListNode(4))),
        'input2': ListNode(1, ListNode(3, ListNode(4))),
        'expected': ListNode(1).val,
      },
      // 2: {
      //   'input': [7, 6, 4, 3, 1],
      //   'expected': 0,
      // },
      // 3: {
      //   'input': [1, 2],
      //   'expected': 1,
      // },
    };

    testCase.forEach((key, value) {
      print('--> Test case: $key');
      print('Input: ${value['input']}');
      print('expected: ${value['expected']}');
      print('Output: ${mergeTwoLists(value['input1'], value['input2'])}');
    });
  }
}

void main(List<String> args) {
  Solutions().runProgram();
}
