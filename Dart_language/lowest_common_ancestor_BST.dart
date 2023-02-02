class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val, {this.left, this.right});
}

class Solution {
  TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    if (root.val > p.val && root.val > q.val) {
      return lowestCommonAncestor(root.left!, p, q);
    } else if (root.val < p.val && root.val < q.val) {
      return lowestCommonAncestor(root.right!, p, q);
    } else {
      return root;
    }
  }

  TreeNode lowestCommonAncestorBroken(TreeNode root, TreeNode p, TreeNode q) {
    bool isParentMatch = root.val == p.val || root.val == q.val;
    bool isChildLeftMatch = root.left?.val == p.val || root.left?.val == q.val;
    bool isChildRightMatch =
        root.right?.val == p.val || root.right?.val == q.val;

    if (isParentMatch) {
      if (isChildLeftMatch || isChildRightMatch) return root;
    } else if (isChildLeftMatch && isChildRightMatch) return root;

    if (root.left != null)
      return lowestCommonAncestorBroken(root.left!, p, q);
    else if (root.right != null)
      return lowestCommonAncestorBroken(root.right!, p, q);
    else
      return root;
  }

  void runProgram() {
    Map testCase = {
      1: {
        'input': TreeNode(2, left: TreeNode(1), right: TreeNode(3)),
        'p': TreeNode(1),
        'q': TreeNode(3),
        'expected': 2,
      },
      2: {
        'input': TreeNode(4,
            left: TreeNode(2, left: TreeNode(1), right: TreeNode(3)),
            right: TreeNode(7, left: TreeNode(6), right: TreeNode(9))),
        'p': TreeNode(2),
        'q': TreeNode(1),
        'expected': 2,
      },
      3: {
        'input': TreeNode(3,
            left: TreeNode(1, left: null, right: TreeNode(2)),
            right: TreeNode(4, left: TreeNode(5), right: TreeNode(6))),
        'p': TreeNode(2),
        'q': TreeNode(4),
        'expected': 3,
      },
    };

    testCase.forEach((key, value) {
      print('--> Test case: $key');
      print('Expected : ${value['expected']}');
      print('Output:');
      TreeNode treeSolution =
          lowestCommonAncestor(value['input'], value['p'], value['q']);
      print(treeSolution.val);
    });
  }
}

void main(List<String> args) {
  Solution().runProgram();
}
