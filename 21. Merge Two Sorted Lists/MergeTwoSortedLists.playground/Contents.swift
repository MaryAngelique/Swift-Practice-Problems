import UIKit

//: 21. Merge Two Sorted Lists

//Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
//
//Example:
//
//Input: 1->2->4, 1->3->4
//Output: 1->1->2->3->4->4



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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        if l1 == nil && l2 == nil {
            return nil
        } else if l1 != nil && l2 == nil {
            return l1
        } else if l1 == nil && l2 != nil {
            return l2
        }
        
        var firstList: ListNode? = l1!.val < l2!.val ? l1 : l2
        var secondList: ListNode? = l1!.val < l2!.val ? l2 : l1
        
        while secondList != nil {
            
            while firstList!.next != nil {
                if secondList!.val <= firstList!.next!.val {
                    let temp = firstList!.next
                    firstList!.next = secondList
                    secondList = temp
                }
                
                firstList = firstList!.next
            }
            
            if firstList!.next == nil {
                firstList!.next = secondList
                break
            }
        }
        
        return l1!.val < l2!.val ? l1 : l2
        
    }
}
