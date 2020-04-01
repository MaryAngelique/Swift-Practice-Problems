import UIKit


//: 48 Rotate Image


//You are given an n x n 2D matrix representing an image.
//
//Rotate the image by 90 degrees (clockwise).
//
//Note:
//
//You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
//
//Example 1:
//
//Given input matrix =
//[
//  [1,2,3],
//  [4,5,6],
//  [7,8,9]
//],
//
//rotate the input matrix in-place such that it becomes:
//[
//  [7,4,1],
//  [8,5,2],
//  [9,6,3]
//]
//Example 2:
//
//Given input matrix =
//[
//  [ 5, 1, 9,11],
//  [ 2, 4, 8,10],
//  [13, 3, 6, 7],
//  [15,14,12,16]
//],
//
//rotate the input matrix in-place such that it becomes:
//[
//  [15,13, 2, 5],
//  [14, 3, 4, 1],
//  [12, 6, 8, 9],
//  [16, 7,10,11]
//]


class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        if matrix.count < 2 {
            return
        }
        for row in 0 ..< matrix.count / 2 {
            for col in row ..< matrix.count - row - 1 {
                let rowTop = row
                let colTop = col
                let top = matrix[rowTop][colTop]
                let rowRight = colTop
                let colRight = matrix.count - rowTop - 1
                let right = matrix[rowRight][colRight]
                let rowBot = colRight
                let colBot = matrix.count - rowRight - 1
                let bot = matrix[rowBot][colBot]
                let rowLeft = colBot
                let colLeft = matrix.count - rowBot - 1
                let left = matrix[rowLeft][colLeft]

                let tmp = left
                matrix[rowLeft][colLeft] = bot
                matrix[rowBot][colBot] = right
                matrix[rowRight][colRight] = top
                matrix[rowTop][colTop] = tmp
            }
        }
    }
}
