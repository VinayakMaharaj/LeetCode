# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def balanceBST(self, root: TreeNode) -> TreeNode:
        def inorder(root):
            if root is None:
                return None
            inorder(root.left)
            lst.append(root)
            inorder(root.right)

        lst = []
        inorder(root)

        def bst(arr):
            if len(arr) == 0:
                return
            mid = len(arr)//2
            root = arr[mid]
            root.left = bst(arr[:mid])
            root.right = bst(arr[mid+1:])
            return root

        return bst(lst)
