import UIKit


//: 10. Regular Expression Matching

//Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*'.
//
//'.' Matches any single character.
//'*' Matches zero or more of the preceding element.
//The matching should cover the entire input string (not partial).
//
//Note:
//
//s could be empty and contains only lowercase letters a-z.
//p could be empty and contains only lowercase letters a-z, and characters like . or *.
//Example 1:
//
//Input:
//s = "aa"
//p = "a"
//Output: false
//Explanation: "a" does not match the entire string "aa".
//Example 2:
//
//Input:
//s = "aa"
//p = "a*"
//Output: true
//Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
//Example 3:
//
//Input:
//s = "ab"
//p = ".*"
//Output: true
//Explanation: ".*" means "zero or more (*) of any character (.)".
//Example 4:
//
//Input:
//s = "aab"
//p = "c*a*b"
//Output: true
//Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
//Example 5:
//
//Input:
//s = "mississippi"
//p = "mis*is*p*."
//Output: false


class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        
        let s = Array(s)
        let p = Array(p)
        
        var grid = [[Bool]](repeating: [Bool](repeating: false, count: p.count + 1), count: s.count + 1)
        
        grid[0][0] = true
        
        var j: Int = 1
        while j < p.count && p[j] == "*" {
            grid[0][j] = true
            grid[0][j + 1] = true
            j += 2
        }
        
        j = 1
        while j <= p.count {
        
            let nextStar = (j < p.count && p[j] == "*")
            
            var i: Int = 1
            while i <= s.count {
            
                if p[j-1] == s[i-1] || p[j-1] == "." {
                    if grid[i-1][j-1] {
                        grid[i][j] = true
                    }
                }
                
                if nextStar && grid[i][j-1] {
                    grid[i][j] = true
                }
                
                if p[j-1] == "*" {
                    
                    if j > 1 && (p[j-2] == s[i-1] || p[j-2] == ".") {
                        if grid[i-1][j] {
                            grid[i][j] = true
                        }
                    }
                    
                    if grid[i][j-1] {
                        grid[i][j] = true
                    }
                }
                i += 1
            }
            j += 1
        }
        return grid[s.count][p.count]
    }
}
