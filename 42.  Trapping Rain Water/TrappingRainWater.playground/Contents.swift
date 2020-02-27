import UIKit

//: 42. Trapping Rain Water

//Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
//
//
//The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!
//
//Example:
//
//Input: [0,1,0,2,1,0,1,3,2,1,2,1]
//Output: 6


class Solution {
   func trap(_ height: [Int]) -> Int
{
    var water = 0
    var left = 0
    var right = height.count-1
    var currentLevel = 0
    while left < right
    {
        var lowerHeight: Int!
        var leftHeight = height[left]
        var rightHeight = height[right]

        if leftHeight < rightHeight
        {
            lowerHeight = leftHeight
            left += 1
        }
        else
        {
            lowerHeight = rightHeight
            right -= 1
        }
        currentLevel = max(lowerHeight, currentLevel)
        water += currentLevel - lowerHeight
    }
    return water
}
}
