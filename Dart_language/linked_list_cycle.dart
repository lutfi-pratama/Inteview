//  Definition for singly-linked list.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solutions {
  hasCycle(ListNode? head) {
    if (head == null) return false;

    ListNode? slow = head;
    ListNode? fast = head;

    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;

      if (slow == fast) return true;
    }

    return false;
  }

  void runProgram() {
    ListNode cycleList1 = ListNode(3, ListNode(2, ListNode(0, ListNode(-4))));
    cycleList1.next!.next!.next!.next = cycleList1.next;
    ListNode cycleList2 = ListNode(1, ListNode(2));
    cycleList2.next!.next = cycleList2;
    ListNode cycleList3 = ListNode(1);

    Map testCase = {
      1: {
        'head': cycleList1,
        'pos': 1,
        'expected': true,
      },
      2: {
        'head': cycleList2,
        'pos': 0,
        'expected': true,
      },
      3: {
        'head': cycleList3,
        'pos': -1,
        'expected': false,
      },
    };

    testCase.forEach((key, value) {
      print('--> Test case: $key');
      print('Head: ${value['head']}');
      print('Pos: ${value['pos']}');
      print('expected: ${value['expected']}');
      print('Output: ${hasCycle(value['head'])}');
    });
  }
}

void main(List<String> args) {
  Solutions().runProgram();
}
