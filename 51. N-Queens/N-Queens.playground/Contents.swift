import UIKit


//: 51. N-Queens

//The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.
//
//
//
//Given an integer n, return all distinct solutions to the n-queens puzzle.
//
//Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.
//
//Example:
//
//Input: 4
//Output: [
// [".Q..",  // Solution 1
//  "...Q",
//  "Q...",
//  "..Q."],
//
// ["..Q.",  // Solution 2
//  "Q...",
//  "...Q",
//  ".Q.."]
//]
//Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above.


class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var positionRes = [[Int]](), curPosition = [Int]()
        recursion(n, &curPosition, &positionRes)
        var res = drawBoard(n, positionRes)
        return res
    }
    
    private func recursion(_ n: Int, _ curPosList: inout [Int], _ res: inout [[Int]]) {
        
        if curPosList.count == n {
            res.append(curPosList)
            return
        }
        
        for position in 0...n - 1 {
            if !isValid(curPosList, position) {
                continue
            }
            curPosList.append(position)
            recursion(n, &curPosList, &res)
            curPosList.removeLast()
        }
    }
    
    private func isValid(_ curPosList: [Int], _ position: Int) -> Bool {
        let size = curPosList.count
        if size == 0 {
            return true
        }
        for i in 0...size - 1 {
            if curPosList[i] == position { // 正上方
                return false
            }
            if (position + size - i) == curPosList[i] { // 对角线右上方
                return false
            }
            if (position - size + i) == curPosList[i] { // 对角线左上方
                return false
            }
        }
        return true
    }
    
    private func drawBoard(_ n: Int, _ positions: [[Int]]) -> [[String]] {
        var boards = [[String]]()
        if positions.count == 0 {
            return boards
        }
        for position in positions {
            var board = [String]()
            for i in 0...n - 1 {
                var row = String()
                for j in 0...n - 1 {
                    let cell = (j == position[i]) ? "Q" : "."
                    row += cell
                }
                board.append(row)
            }
            boards.append(board)
        }
        return boards
    }
}
