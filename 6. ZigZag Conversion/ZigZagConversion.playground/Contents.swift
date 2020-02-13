import UIKit


//The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
//
//P   A   H   N
//A P L S I I G
//Y   I   R
//And then read line by line: "PAHNAPLSIIGYIR"
//
//Write the code that will take a string and make this conversion given a number of rows:
//
//string convert(string s, int numRows);
//Example 1:
//
//Input: s = "PAYPALISHIRING", numRows = 3
//Output: "PAHNAPLSIIGYIR"
//Example 2:
//
//Input: s = "PAYPALISHIRING", numRows = 4
//Output: "PINALSIGYAHRPI"
//Explanation:
//
//P     I    N
//A   L S  I G
//Y A   H R
//P     I

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        var curRow = 0
        let array = Array(s)
        var result = ""
        
        for row in 0..<numRows {
            var i = 0
            var index = i * (2 * numRows - 2) + row
            
            while index < array.count {
                result.append(array[index])
                i += 1
                let prevIndex = index
                index = i * (2 * numRows - 2) + row
                let nextIndex = i * (2 * numRows - 2) - row

                if nextIndex < array.count, nextIndex != index, nextIndex != prevIndex {
                    result.append(array[nextIndex])
                }
            }
        }
        
        return result
    }
}
