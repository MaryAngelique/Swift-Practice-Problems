import UIKit

//: 9. Palindrome Number

//Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
//
//Example 1:
//
//Input: 121
//Output: true
//Example 2:
//
//Input: -121
//Output: false
//Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
//Example 3:
//
//Input: 10
//Output: false
//Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
//Follow up:
//
//Coud you solve it without converting the integer to a string?

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if (x < 0 || (x % 10 == 0 && x != 0)) { return false }

        var xMutable = x
        var reversed = 0

        while xMutable > reversed {
            let remainder = xMutable % 10
            reversed = (reversed * 10) + remainder
            xMutable = xMutable / 10
        }
        return xMutable == reversed ||  xMutable == reversed / 10
    }
}
