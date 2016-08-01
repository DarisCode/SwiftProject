//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// closure
// press button and then do closure

let closure1 = { (number1:Int) -> Int in return number1 }
closure1(3)

let closure2 = { (number1:Int , number2:Int) -> Int in return number1 + number2}
closure2(7, 8)

var language = ["Java", "PHP", "C++", "ObjC", "Swift", "C"]

// Traditional Syntax

let sortResult1 = language.sort(
    { (S1:String, S2:String) ->Bool in
        return S1 < S2
})

//Improve ()
//sort is built-in methods
//Using Quick sort
let sortResult2 = language.sort()
    { (S1:String, S2:String) ->Bool in
        return S1 < S2
}
sortResult2

// take out ()
// S1 < S2 String compare
let sortResult3 = language.sort
    { (S1:String, S2:String) ->Bool in
        return S1 < S2
    }

let sortResult4 = language.sort
    {
        (S1, S2) ->Bool in
        return S1 < S2
    }

let sortResult5 = language.sort
    {
        S1, S2 ->Bool in
        return S1 < S2
    }

let sortResult6 = language.sort
    {
        S1, S2 in
        return S1 < S2
    }

let sortResult7 = language.sort
    {
        S1, S2 in S1 < S2
    }

let sortResult8 = language.sort
    {
        $0 < $1
    }

let sortResult9 = language.sort(<)
let sortResult10 = language.sort(>)

var number = 10

let closure3 =

    {
    (input1:Int, input2:Int) -> Int in return input1 + input2 + number
    }

closure3(3,5)

number = 20

closure3(3,5)

//Differ with Block and Closure
//Block is fork itself
//But closure will reference the global variable


var numbers = [87,42,11,39,98,45]
let sortNumberResult1 = numbers.sort
    
    { (n1, n2) -> Bool in
    n1 < n2
    }

sortNumberResult1
numbers.sortInPlace()


