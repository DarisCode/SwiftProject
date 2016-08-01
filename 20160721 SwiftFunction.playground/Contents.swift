//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1
func func1() -> Int
{
    return 888
}

func1()
//2
func func2()
{
    //不回傳東西
}
//3
func func3(input1:Int,input2:Int) -> Int
{
    //
    return input1 + input2
}
//Swift 3將支援第一個參數
//func3(input1: 3, input2: 8)
func3(3, input2: 8)
//4
//函式外名稱定義名稱不同
//number1是外部名稱
func func4(number1 input1:Int,number2 input2:Int) -> Int
{
    //
    return input1 + input2
}
func4(number1: 5, number2: 8)
//5
//可不帶參數
func func3(input1:Int,_ input2:Int) -> Int
{
    //
    return input1 + input2
}
func3(3, 8)
//6
func func6(who:String,action:String,target:String) ->String
{
    return who + action + target
}

func6("我", action: "愛吃", target: "雞排")
//7
func func7(who:String,action:String,target:String = "雞排") ->String
{
    return who + action + target
}
func7("我", action: "愛吃")//使用預設
func7("我", action: "愛吃", target:"牛排")//可以覆寫
//8
func func8(who:String = "我", action:String = "愛吃", target:String = "雞排") ->String
{
    return who + action + target
}
func8()
func8(action: "非常想吃")//更換action
func8(target: "火鍋")//更換targer
func8("你")//更換who,因為who 是第一個被呼叫的參數
//更換順序也可以
func8(action: "非常想吃", target: "火鍋")
func8(target: "火鍋",action: "非常想吃")

//9

var input1 = 10
var input2 = 5

//預設參數是let Java跟Obj-C都是變數
func func9(number1: Int, number2:Int)
{
    //let tmp = number1
    //number1 = number2
    //number2 = number1
    
}
//如果還是想要變成變數 swift 3.0函數變成let常數
//如果是常數變成變數會常常造成混淆
//func func9(var number1: Int, var number2:Int)
//{
//    let tmp = number1
//    number1 = number2
//    number2 = number1
//}
//帶入時會複製一份值
//局部變數是Clone出來的
//func9(input1, number2: input2)

//Swift -- Call by value
//input1?
//input2?

//10 可以類似Call by reference的效果
//宣告inout 然後使用的時候要加&
func func10(inout number1:Int, inout number2:Int)
{
    let tmp = number1
    number1 = number2
    number2 = tmp
}

func10(&input1, number2: &input2)

//11 
func func11(numbers:Int...) -> Int
{
    var result = 0
    for i in numbers
    {
        result += i
    }
    return result
}

func11(1,3,5)
func11(1,3,5,7,9,11)
func11(1,3)

//12 傳回多個的（效果）借用tuple來實現

func func12 (in1:Int, in2:Int) -> (Int , Int)
{
    return (in2,in1)
}

func12(7, in2: 8)//拿出來會顛倒

//13 丟兩個傳回三個
func func13 (in1:Int, in2:Int) -> (A:Int , B:Int, SUM:Int)
{
    return (in2,in1, in1+in2)
}

let result1 = func13(5, in2: 6)
result1.A
result1.B
result1.SUM

//14 子函式
// -> Int -> Double 吃Int 吐出Double
func getRate(years:Int) -> (Int -> Double)
{
    func rate1(amount:Int) ->Double
    {
        return Double(amount) * 1.01
    }
    func rate2(amount:Int) ->Double
    {
        return Double(amount) * 1.02
    }
    func rate3(amount:Int) ->Double
    {
        return Double(amount) * 1.03
    }
    
    if years <= 2
    {
        return rate1
    }
    else if years <= 4
    {
        return rate2
    }
    else
    {
        return rate3
    }
        
}

let ratefunc = getRate(1)
ratefunc(16861)

//金融業底層串接(規則），寫成類別函式，一位寫ＵＩ（負責呼叫）
//把幾年期丟進去

//15 (Int -> Double)?吐出去的是可選型別
//
func getRate2(years:Int) -> (Int -> Double)?
{
    func rate1(amount:Int) ->Double
    {
        return Double(amount) * 1.01
    }
    func rate2(amount:Int) ->Double
    {
        return Double(amount) * 1.02
    }
    func rate3(amount:Int) ->Double
    {
        return Double(amount) * 1.03
    }
    
    if years <= 2
    {
        return rate1
    }
    else if years <= 4
    {
        return rate2
    }
    else if years <= 10
    {
        return rate3
    }
    else
    {
        return nil
    }
    
}

//rateFunc2是可選型別
let rateFunc2 = getRate2(11)
//如果不完全確定是不是nil要用? 拿到的是optional
//完全確定是nil就使用！
let result2 = rateFunc2?(10000)
print("Result2:\(result2)")









