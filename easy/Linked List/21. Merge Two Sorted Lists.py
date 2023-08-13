# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeTwoLists(self, a: Optional[ListNode], b: Optional[ListNode]) -> Optional[ListNode]:
        # defining new list which, we will return further
        newlist = ListNode()

        # We take returning list as a current node
        current_node = newlist

        # In this while
        while True:
            # If one of the lists has ended, the second goes to the end
            if a is None:
                current_node.next = b
                break
            if b is None:
                current_node.next = a
                break
            # If it is not over yet, we have to check between two active current element(a,b)
            # We take smaller value and forward it to the next element. (ex. a.next or b.next)
            if a.val > b.val:
                current_node.next = ListNode(b.val)
                b = b.next
            else:
                current_node.next = ListNode(a.val)
                a = a.next
            # As we placed element in a current_node, we have to go to the next one
            current_node = current_node.next

        # After we sorted them out, we return newlist.next,
        # because all of the elements were sorted to the first,
        # empty one(first item is empty, so we return.next)
        return newlist.next
