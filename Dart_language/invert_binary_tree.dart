//  Definition for singly-linked list.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val, {this.left, this.right});
}

class Solutions {
  void printTree(TreeNode? tree) {
    // Metode : In-order-tranveral
    if (tree == null) return;

    printTree(tree.left);
    print(tree.val);
    printTree(tree.right);
  }

  TreeNode? invertTree(TreeNode? node) {
    if (node == null) return null;

    // recursive calls
    invertTree(node.left);
    invertTree(node.right);

    // swap current node children (left and right)
    TreeNode? temp = node.left;
    node.left = node.right;
    node.right = temp;

    return node;
  }

  void runProgram() {
    Map testCase = {
      1: {
        'input': TreeNode(2, left: TreeNode(1), right: TreeNode(3)),
        'expected': [2, 3, 1],
      },
      2: {
        'input': TreeNode(4,
            left: TreeNode(2, left: TreeNode(1), right: TreeNode(3)),
            right: TreeNode(7, left: TreeNode(6), right: TreeNode(9))),
        'expected': [4, 7, 2, 9, 6, 3, 1],
      },
    };

    testCase.forEach((key, value) {
      print('--> Test case: $key');
      print('Input: ');
      printTree(value['input']);
      // print('expected: ${value['expected']}');
      print('Output:');
      TreeNode? newTree = invertTree(value['input']);
      printTree(newTree);
    });
  }
}

void main(List<String> args) {
  Solutions().runProgram();
}


// Output:

// --> Test case: 1
// Input: 
// 1
// 2
// 3
// Output:
// 3
// 2
// 1
// --> Test case: 2
// Input: 
// 1
// 2
// 3
// 4
// 6
// 7
// 9
// Output:
// 9
// 7
// 6
// 4
// 3
// 2
// 1
