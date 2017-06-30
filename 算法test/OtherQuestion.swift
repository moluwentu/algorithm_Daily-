//
//  OtherQuestion.swift
//  算法test
//
//  Created by 叶慧伟 on 2017/6/29.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

import UIKit

class OtherQuestion: NSObject {
    ///****** 1 ******
    /// Given a string, you need to reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.
    ///Example:
    ///Input: "Let's take LeetCode contest"
    ///Output: "s'teL ekat edoCteeL tsetnoc"
    ///Note: In the string, each word is separated by single space and there will not be any extra space in the string.
    func reverseWords(_ s: String) -> String {
        let arr = s.components(separatedBy: " ")
        var fullStr = String.init()
        
        for (index,str) in arr.enumerated() {
            let daoStr = String(str.characters.reversed())
            index == arr.count - 1 ? fullStr.append(daoStr) : fullStr.append(daoStr + " ")
        }
        return fullStr
    }

    /// ****** 2 ******
    /// Given an integer array with even length, where different numbers in this array represent different kinds of candies. Each number means one candy of the corresponding kind. You need to distribute these candies equally in number to brother and sister. Return the maximum number of kinds of candies the sister could gain.
    ///
    /// - Example 1:
    ///Input: candies = [1,1,2,2,3,3]
    ///Output: 3
    ///Explanation:
    ///There are three different kinds of candies (1, 2 and 3), and two candies for each kind.
    ///Optimal distribution: The sister has candies [1,2,3] and the brother has candies [1,2,3], too.
    ///The sister has three different kinds of candies.
    /// - Example 2:
    ///Input: candies = [1,1,2,3]
    ///Output: 2
    ///Explanation: For example, the sister has candies [2,3] and the brother has candies [1,1].
    ///The sister has two different kinds of candies, the brother has only one kind of candies.
    
    func distributeCandies(_ candies: [Int]) -> Int {
        return min(candies.count / 2, Array(Set(candies)).count)
    }
}
