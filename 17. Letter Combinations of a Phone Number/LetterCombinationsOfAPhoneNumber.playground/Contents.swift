import UIKit


//: 17. Letter Combinations of a Phone Number


//Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
//
//A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
//
//Example:
//
//Input: "23"
//Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
//Note:
//
//Although the above answer is in lexicographical order, your answer could be in any order you want.

class Solution {
    var output = [String]()
    let numbers = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]

    func combine(combination: String, digits: String) {
        if digits.isEmpty {
            output.append(combination)
        } else {
            let digit = digits.first!
            let pair: String! = numbers[String(digit)]

            pair.forEach {
                combine(combination: combination + String($0),
                        digits: String(digits.dropFirst()))
            }
        }
    }

    func letterCombinations(_ digits: String) -> [String] {
        guard digits.isEmpty == false else { return [] }
        combine(combination: "", digits: digits)

        return output
    }
}
