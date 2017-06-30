//
//  TreeQuestion.swift
//  算法test
//
//  Created by 叶慧伟 on 2017/6/29.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class TreeQuestion: NSObject {

    ///****** 1 ******
    /// Given two binary trees and imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.
    ///You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.
    ///
    /// Example:
    /// Input:
    ///  Tree 1                     Tree 2
    ///    1                         2
    ///   / \                       / \
    ///  3   2                     1   3
    /// /                           \   \
    ///5                             4   7
    ///Output:
    ///Merged tree:
    ///     3
    ///    / \
	///   4   5
    ///  / \   \
    /// 5   4   7
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if (t1 == nil || t2 == nil){
            return (t1 != nil) ? t1 : t2
        }
        
        let ans = TreeNode.init((t1?.val)! + (t2?.val)!)
        ans.left = mergeTrees(t1?.left , t2?.left)
        ans.right = mergeTrees(t1?.right, t2?.right)
        return ans
    }

}
