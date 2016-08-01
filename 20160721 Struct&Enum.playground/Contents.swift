//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 1 Data Structure
// struct could put code inside
// Diff with class is struct can not "inherit" !
// Use in so many parameter
struct Box
{
    var 長 = 10
    var 寬 = 15
    var 高 = 20
    var 名稱 = "盒子"
    
    func 計算體積() -> Int {
        return 長 * 寬 * 高
    }
}

let box1 = Box()
let 體積1 = box1.長 * box1.寬 * box1.高
let 體積2 = box1.計算體積()

// 2 enum
// enum at Swift could be String
enum BloodType:String
{
    case o = "Type O"
    case A = "Type A"
    case B = "Type B"
    case AB = "Type AB"
}

let myBloodType = BloodType.AB
myBloodType.rawValue

if myBloodType == .o
{
    //...
}
else if myBloodType == .AB
{
    //...
}





