import UIKit

//: 29. Divide Two Integer

//Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.
//
//Return the quotient after dividing dividend by divisor.
//
//The integer division should truncate toward zero.
//
//Example 1:
//
//Input: dividend = 10, divisor = 3
//Output: 3
//Example 2:
//
//Input: dividend = 7, divisor = -3
//Output: -2
//Note:
//
//Both dividend and divisor will be 32-bit signed integers.
//The divisor will never be 0.
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 231 − 1 when the division result overflows.

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let isNegative = (dividend > 0 && divisor < 0) || (dividend < 0 && divisor > 0)
        guard dividend != divisor else { return 1 }
        guard dividend != 0 else { return 0 }
        var y = abs(divisor)
        var x = abs(dividend)
        if dividend == Int(Int32.max), y == 1 {
            return isNegative ? -Int(Int32.max) : dividend
        }
        if dividend == Int(Int32.min), y == 1 {
            return isNegative ? Int(Int32.min) : Int(Int32.max)
        }
        guard y != x else { return -1 }
        var count = 0
        while (x > y) {
            var i = 1
            var j = 0
            while (x > y) {
                y = y << 1
                i = i << 1
                j += 1
            }
            if (y > x) {
                i = i >> 1
                y = y >> 1
                j -= 1
            }
            x -= y
            y = y >> j
            count += i
        }
        return isNegative ? -count : count
    }
}
