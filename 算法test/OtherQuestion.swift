//
//  OtherQuestion.swift
//  算法test
//
//  Created by 叶慧伟 on 2017/6/29.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

import UIKit

class OtherQuestion: NSObject {
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

}
