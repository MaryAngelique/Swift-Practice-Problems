import UIKit

//: Merge K Sorted Lists

//Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
//
//Example:
//
//Input:
//[
//  1->4->5,
//  1->3->4,
//  2->6
//]
//Output: 1->1->2->3->4->4->5->6


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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        if(lists.count == 1) {
            return lists[0]
        }
        
        var root:ListNode?
        var result:ListNode?
        
        var nodeList = lists
        
        var minValue = Int.max
        var minNode:ListNode?
        var minNodeIndex = 0
        
        var foundNotNull = false
        
        while(true) {
            
            minValue = Int.max
            foundNotNull = false
            
            for i in 0..<nodeList.count {
                
                guard let node = nodeList[i] else {
                    continue
                }
                
                foundNotNull = true
                if(node.val < minValue) {
                    minValue = node.val
                    minNode = node
                    minNodeIndex = i
                }
            }
            
            if(foundNotNull == false) {
                break
            }
            nodeList[minNodeIndex] = minNode!.next
            
            if(result == nil) {
                root = minNode
                result = minNode
            } else {
                result!.next = minNode
                result = minNode
            }
            
            
        }
        
        return root
    }
    
    
}
