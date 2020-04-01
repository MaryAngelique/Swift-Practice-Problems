import UIKit

//: 54. Spiral Matrix

//Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
//
//Example 1:
//
//Input:
//[
// [ 1, 2, 3 ],
// [ 4, 5, 6 ],
// [ 7, 8, 9 ]
//]
//Output: [1,2,3,6,9,8,7,4,5]
//Example 2:
//
//Input:
//[
//  [1, 2, 3, 4],
//  [5, 6, 7, 8],
//  [9,10,11,12]
//]
//Output: [1,2,3,4,8,12,11,10,9,5,6,7]


class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0 else { return [] }
        
        var answer: [Int] = []
        
        let row = matrix.count
        let column = matrix[0].count
        
        var seen: [[Bool]] = Array(repeating: Array(repeating: false, count: matrix[0].count), count: matrix.count)
        
        var r = 0, c = 0, diIndex = 0
        let dr = [0, 1, 0, -1]
        let dc = [1, 0, -1, 0]
        
        for _ in 0..<row*column {
            answer.append(matrix[r][c])
            seen[r][c] = true
            let nextR = r + dr[diIndex]
            let nextC = c + dc[diIndex]
            if nextR >= 0, nextR < row, nextC >= 0, nextC < column, !seen[nextR][nextC] {
                r = nextR
                c = nextC
                
            } else {
                diIndex = (diIndex + 1) % 4
                r += dr[diIndex]
                c += dc[diIndex]
            }
        }
        return answer
    }
}
