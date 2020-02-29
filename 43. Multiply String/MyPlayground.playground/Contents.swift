import UIKit

//: 43. Multiply Strings


//Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.
//
//Example 1:
//
//Input: num1 = "2", num2 = "3"
//Output: "6"
//Example 2:
//
//Input: num1 = "123", num2 = "456"
//Output: "56088"
//Note:
//
//The length of both num1 and num2 is < 110.
//Both num1 and num2 contain only digits 0-9.
//Both num1 and num2 do not contain any leading zero, except the number 0 itself.
//You must not use any built-in BigInteger library or convert the inputs to integer directly.

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        
        var smallString = num1, largeString = num2
        if smallString.count > largeString.count { smallString = num2; largeString = num1 }
        
        let small = smallString.compactMap { Int(String($0)) }
        let large = largeString.compactMap { Int(String($0)) }
        
        if small.count <= 0 { return "0" }
        if large.count <= 0 { return "0" }
        
        let length = small.count + large.count + 1
        var workout = [[Int]](repeating: [Int](repeating: 0, count: length), count: small.count)
        
        var i = small.count - 1
        var shift = 0
        
        while i >= 0 {
            let val1 = small[i]
            var carry = 0
            var j = large.count - 1
            var paste = length - (1 + shift)
            while j >= 0 {
                let val2 = large[j]
                let num = val1 * val2 + carry
                workout[i][paste] = num % 10
                carry = num / 10
                j -= 1
                paste -= 1
            }
            while carry > 0 {
                workout[i][paste] = carry % 10
                carry /= 10
                paste -= 1
            }
            shift += 1
            i -= 1
        }
        
        var j = length - 1
        
        
        var res = [Int](repeating: 0, count: length)
        
        var carry: Int = 0
        while j >= 0 {
            var sum: Int = carry
            i = 0
            while i < small.count {
                sum += workout[i][j]
                i += 1
            }
            res[j] = sum % 10
            carry = sum / 10
            j -= 1
        }
        
        var zeroIndex = 0
        while zeroIndex < length && res[zeroIndex] == 0 { zeroIndex += 1 }
        if zeroIndex == length { zeroIndex = length - 1 }
        res = Array(res[zeroIndex...])
        
        return res.map { String($0) }.joined()
    }
}
