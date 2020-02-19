import UIKit

//: 30. Substring with Concatenation of All Words

//You are given a string, s, and a list of words, words, that are all of the same length. Find all starting indices of substring(s) in s that is a concatenation of each word in words exactly once and without any intervening characters.
//
//
//
//Example 1:
//
//Input:
//  s = "barfoothefoobarman",
//  words = ["foo","bar"]
//Output: [0,9]
//Explanation: Substrings starting at index 0 and 9 are "barfoo" and "foobar" respectively.
//The output order does not matter, returning [9,0] is fine too.
//Example 2:
//
//Input:
//  s = "wordgoodgoodgoodbestword",
//  words = ["word","good","best","word"]
//Output: []

class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        
        var res = [Int]()
        if words.count == 0 { return res }
        
        let wordLen = words[0].count
        if wordLen == 0 { return res }
        
        let keySize = wordLen * words.count
        
        var dic = [String: Int]()
        
        var wordCount: Int = words.count
        
        for word in words {
            addWord(word, &dic)
        }
        
        let s = Array(s)
        for startIndex in 0..<wordLen {
            
            var front = startIndex
            var end = startIndex
            
            while front < (s.count - (keySize - 1)) {
                
                let bookend = substring(s, end, wordLen)

                if dic[bookend] == nil {
                    while front != end {
                        addWord(substring(s, front, wordLen), &dic)
                        wordCount += 1
                        front += wordLen;
                    }
                    end += wordLen;
                    front = end;
                    continue;
                }
                
                guard let count = dic[bookend] else {
                    print("Logic is broken")
                    return res
                }
                
                if count > 0 {
                    removeWord(bookend, &dic)
                    wordCount -= 1
                    if wordCount == 0 {
                        res.append(front)
                    }
                    end += wordLen
                } else {
                    addWord(substring(s, front, wordLen), &dic)
                    wordCount += 1
                    front += wordLen
                }
            }
        }
        return res
    }
    
    func substring(_ s: [Character], _ index: Int, _ count: Int) -> String {
        if index < s.count {
            var endIndex = index + count
            if endIndex > s.count { endIndex = s.count }
            return String(s[index..<endIndex])
        }
        return ""
    }
    
    func addWord(_ word: String, _ dic: inout [String: Int]) {
        if var count = dic[word] {
            count += 1
            dic[word] = count
        } else {
            dic[word] = 1
        }
    }
    
    func removeWord(_ word: String, _ dic: inout [String: Int]) {
        if var count = dic[word] {
            count -= 1
            dic[word] = count
        }
    }
}
