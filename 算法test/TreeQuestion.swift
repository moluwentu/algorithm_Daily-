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
    
    
    /// ****** 2 ******
    ///Given a binary tree, find the leftmost value in the last row of the tree.
    ///Example:
    ///Input:
    
    ///      1
    ///     / \
    ///    2   3
    ///   /   / \
    ///  4   5   6
    ///  /
    /// 7
    
    ///Output:
    ///7
    ///Note: You may assume the tree (i.e., the given root node) is not NULL.
    var ans = 0
    var h = 0
    
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        
        findBottomLeftValue(root: root!, depth: 1)
        
        return ans
    }
    
    func findBottomLeftValue(root : TreeNode, depth : Int) {
        if h < depth {
            ans = root.val
            h = depth
        }
        if root.left != nil {
            findBottomLeftValue(root: root.left!, depth: depth + 1)
        }
        if root.right != nil {
            findBottomLeftValue(root: root.right!, depth: depth + 1)
        }
    }
    
    /// ****** 3 ******
    ///You need to find the largest value in each row of a binary tree.
    ///Example:
    ///Input:
    
    ///      1
    ///     / \
    ///    3   2
    ///   / \   \
    ///  5   3   9
    
    ///Output: [1, 3, 9]
    
    var result = [Int]();
    
    func largestValues(_ root: TreeNode?) -> [Int] {
        
        getLargestValues(root: root, row: 0)
        
        return result
    }
    
    func getLargestValues(root : TreeNode?, row : Int) {
        if root == nil {
            return
        }
        
        if row == result.count {
            result.append(root!.val)
        }else{
            result[row] = max(result[row], root!.val)
        }
        
        getLargestValues(root: root!.left, row: row + 1)
        getLargestValues(root: root!.right, row: row + 1)
    }
    
    /// ****** 4 ******
    ///You need to construct a string consists of parenthesis and integers from a binary tree with the preorder traversing way.
    
    ///The null node needs to be represented by empty parenthesis pair "()". And you need to omit all the empty parenthesis pairs that don't affect the one-to-one mapping relationship between the string and the original binary tree.
    ///Input: Binary tree: [1,2,3,4]
    ///      1
    ///    /   \
    ///   2     3
    ///  /
    /// 4
    
    ///Output: "1(2(4))(3)"
    
    ///Explanation: Originallay it needs to be "1(2(4)())(3()())",
    ///but you need to omit all the unnecessary empty parenthesis pairs.
    ///And it will be "1(2(4))(3)".
    func tree2str(_ t: TreeNode?) -> String {
        if t == nil {
            return ""
        }
    
        let result = String(t!.val) + ""
        
        let left = tree2str(t!.left)
        let right = tree2str(t!.right) + ""
        
        if left.isEmpty && right.isEmpty{
            return result
        }
        if left.isEmpty{
            return result + "()" + "(" + right + ")"
        }
        if right.isEmpty {
            return result + "(" + left + ")"
        }
        
        return result + "(" + left + ")" + "(" + right + ")"
    }

    /// ****** 5 ******
    ///    Given two binary trees and imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.
    ///
    ///    You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.
    
    class Solution {
        func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
            if t1 == nil {return t2}
            if t2 == nil {return t1}
            
            t1!.val += t2!.val
            t1!.left = mergeTrees(t1!.left, t2!.left)
            t1!.right = mergeTrees(t1!.right, t2!.right)
            
            return t1
        }
    }
   
}
