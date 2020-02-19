import UIKit

//: 24. Swap Nodes in Pairs

//You may not modify the values in the list's nodes, only nodes itself may be changed.
//
//
//
//Example:
//
//Given 1->2->3->4, you should return the list as 2->1->4->3.

//Definition for singly-linked list.
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0);
        var start = dummy
        if var node = head {
            start.next = node
            while true {
                if let next = node.next {
                    let tail = next.next
                    next.next = node
                    start.next = next
                    node.next = tail
                    start = node
                    if let newNode = tail {
                        node = newNode
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
        }
        
        return dummy.next
    }
}
