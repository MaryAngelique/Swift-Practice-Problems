import UIKit

//: Container With Most Water


//Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
//
//Note: You may not slant the container and n is at least 2.

//The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

//Example:
//
//Input: [1,8,6,2,5,4,8,3,7]
//Output: 49


class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var i = 0
        var j = height.count - 1
        var water = 0
        var currentHeight = 0
        var width = 0
        while i < j{
            currentHeight = min(height[i], height[j])
            width = j - i
            water = max(water, currentHeight*width)
            if height[i] < height[j]{
                i += 1
            } else {
                j -= 1
            }
        }
        return water
    }
}
