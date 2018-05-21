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
            let daoStr = String(String(str).reversed())
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
    
    ///****** 3 ******
    /// Write a program that outputs the string representation of numbers from 1 to n.
    
    ///But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
    ///
    /// - Example:    
    /// n = 15,
    ///
    /// Return:
    /// [
    /// "1",
    /// "2",
    /// "Fizz",
    /// "4",
    /// "Buzz",
    /// "Fizz",
    /// "7",
    /// "8",
    /// "Fizz",
    /// "Buzz",
    /// "11",
    /// "Fizz",
    /// "13",
    /// "14",
    /// "FizzBuzz"
    //// ]
    func fizzBuzz(_ n: Int) -> [String] {
        var arr = [String]()
        
        for index in 1...n {
            var str = String(index)
            
            if index % 3 == 0 {
                str = "Fizz"
            }
            if index % 5 == 0 {
                str  = "Buzz"
            }
            if index % 5 == 0 && index % 3 == 0 {
                str = "FizzBuzz"
            }
            
            arr.append(str)
        }
        return arr
    }
    
    /// ****** 4 ******
    ///Given an array of numbers nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once.
    
    ///For example:
    
    ///Given nums = [1, 2, 1, 3, 2, 5], return [3, 5].
    
    ///Note:
    ///The order of the result is not important. So in the above example, [5, 3] is also correct.
    ///Your algorithm should run in linear runtime complexity. Could you implement it using only constant space complexity?
    func singleNumber(_ nums: [Int]) -> [Int] {
        var numSet : Set = Set<Int>()
        
        for num in nums {
            if numSet.contains(num) {
                numSet.remove(num)
            }else{
                numSet.insert(num)
            }
        }
        
        let numArr = Array(numSet)
        
        return numArr
    }
    
    /// ****** 5 ******
    ///Given a sorted array consisting of only integers where every element appears twice except for one element which appears once. Find this single element that appears only once.
    ///Example 1:
    ///Input: [1,1,2,3,3,4,4,8,8]
    ///Output: 2
    
    ///Example 2:
    ///Input: [3,3,7,7,10,11,11]
    ///Output: 10
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1
        //思路：主要用二分法,取中间数的前一个和后一个对比，相同代表不同的在后半部分，不同代表在前半部分，注意总数的奇偶
        while start < end {
            var mid = (start + end) / 2
            if(mid % 2) == 1{
                mid -= 1
            }
            
            if nums[mid] == nums[mid + 1] {
                start = mid + 2
            }else{
                end = mid
            }
        }
        return nums[start]
    }
    ///****** 5 ******
    ///    Given a non-empty string containing an out-of-order English representation of digits 0-9, output the digits in ascending order.
    ///
    ///    Note:
    ///    Input contains only lowercase English letters.
    ///    Input is guaranteed to be valid and can be transformed to its original digits. That means invalid inputs such as "abc" or "zerone" are not permitted.
    ///    Input length is less than 50,000.
    
    ///    Example 1:
    ///    Input: "owoztneoer"
    ///
    ///    Output: "012"
    ///    Example 2:
    ///    Input: "fviefuro"
    ///
    ///    Output: "45"
    func originalDigits(_ s: String) -> String {
        var array = [0,0,0,0,0,0,0,0,0,0]
  
        for c in String(s) {
            if c == "z" {array[0]+=1}
            if c == "o" {array[1]+=1} //0,1,2,4
            if c == "w" {array[2]+=1}
            if c == "h" {array[3]+=1} //3,8
            if c == "u" {array[4]+=1}
            if c == "f" {array[5]+=1} //4,5
            if c == "x" {array[6]+=1}
            if c == "s" {array[7]+=1}  //6,7
            if c == "g" {array[8]+=1}
            if c == "i" {array[9]+=1} //5,6,8,9
        }
        
        array[7]-=array[6]
        array[5]-=array[4]
        array[3]-=array[8]
        array[9] = array[9] - array[5] - array[6] - array[8]
        array[1] = array[1] - array[0] - array[2] - array[4]
        
        var resultStr = ""
        for i in 0...9 {
            for j in 0...array[i]{
                if j != 0{
                    resultStr.append(String(i))
                }
            }
        }
        
        return resultStr
    }
    
    ///****** 6 ******
    //Given an array of integers, return indices of the two numbers such that they add up to a specific target.
    //
    //You may assume that each input would have exactly one solution, and you may not use the same element twice.
    /// Example
    //    Given nums = [2, 7, 11, 15], target = 9,
    //
    //    Because nums[0] + nums[1] = 2 + 7 = 9,
    //    return [0, 1].
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var maps = Dictionary<Int, Int>()
        
        for (i,num) in nums.enumerated(){
             let complement = target - nums[i]
            for (key,value) in maps{
                if value == complement{
                    return [key,i]
                }
            }
            maps[i] = num
        }
        
        print("can't find num")
        return []
    }
}

