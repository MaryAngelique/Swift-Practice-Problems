import UIKit

//: 32. Longest Valid Parentheses

//Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
//
//Example 1:
//
//Input: "(()"
//Output: 2
//Explanation: The longest valid parentheses substring is "()"
//Example 2:
//
//Input: ")()())"
//Output: 4
//Explanation: The longest valid parentheses substring is "()()"

class Solution {
    func longestValidParentheses(_ string: String) -> Int {
        guard !string.isEmpty else {
            return 0
        }
        
        var actions = [Int]()
        var mx = 0
        var counter = 0
        var lastOpenIndex = -1
        
        for ch in string {
            if ch == "(" {
                actions.append(0)
                lastOpenIndex = actions.count - 1
            } else if ch == ")" {
                if lastOpenIndex >= 0,
                    actions[lastOpenIndex] == 0 {
                    actions[lastOpenIndex] = 1
                    lastOpenIndex = -1
                    for index in stride(from: actions.count - 1, through: 0, by: -1) {
                        if actions[index] == 0 {
                            lastOpenIndex = index
                            break
                        }
                    }
                } else {
                    actions.append(-1)
                }
            }
        }
        
        for item in actions {
            if item == 1 {
                counter += 2
            } else {
                mx = max(mx, counter)
                counter = 0
            }
        }
        
        mx = max(mx, counter)
        return mx
    }
}
