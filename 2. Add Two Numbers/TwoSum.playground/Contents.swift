import UIKit

//: 2. Add Two Numbers
//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//Example:
//
//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807.


//  Definition for singly-linked list.
 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carry = 0
        var cur1 = l1
        var cur2 = l2
        var result: ListNode?
        var curRes: ListNode?
        while cur1 != nil || cur2 != nil {
            var newVal = (cur1?.val ?? 0) + (cur2?.val ?? 0) + carry
            carry = newVal / 10
            newVal = newVal % 10
            let newNode = ListNode(newVal)
            if result == nil {
                result = newNode
                curRes = result
            } else {
                curRes!.next = newNode
                curRes = curRes?.next
            }
            cur1 = cur1?.next
            cur2 = cur2?.next
        }
        
        if carry != 0 {
            curRes?.next = ListNode(carry)
        }
        
        return result ?? ListNode(0)
    }
}
