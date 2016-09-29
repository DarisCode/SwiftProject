//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//轉型
var number1:Int = 123
var pi:Double = 3.1415926

//常數
let PI = 3.14159

//相加
pi += 1.23

//強制轉型
pi = Double(number1)


let xPI = 3.9
var number2:Int = Int(xPI * 3)
var number3:Int = Int(xPI) * 3

/* Wrong */

//var number4:Int = xPI * 3

//不能不給初始值
var number4:UInt64

number2 += 1
let result1 = number2
number2
let result2 = ++number2
number2

number4 = UInt64(number2)
number4 += 1


str += "早安"

//不同型別混合使用需要轉換
let str2 = "早安" + "午安" + String(number4)

//
let str3 = "早安午安\(number4)"

let 💀 = 3
let 😈 = 5
let 動物總數 = "總共有\(😈+💀)隻"
let 有幾隻腳 = "\(😈)八隻腳\(💀)隻兔，合計有\(💀+😈)隻"


func func1(number1:Int,number2:Int) -> Int {
    return number1 + number2
}

func1(3, number2: 5)
//let  aFunc:(a:Int, b:Int)->Int
let aFunc:(Int, Int)->Int

aFunc = func1
//aFunc(a:9, b:10)
aFunc(9,10)

//可選型別
var number5:Int = 5

var number6:Int? = 5
//
var number7:Int! = 3

//number6 = nil
//let result3 = number5 + number6!
//解包前不可是nil


//安全解包法 如果是nil才解包 如果不是nil就給0
let result3 = number5 + (number6 == nil ? 0:number6!)
//如果是nil就直接給0
let result4 = number5 + (number6 ?? 0)

/*    ++i  or  i++
int i, j;
i= 10;
j= ++i;

// i= 11, j= 11

int i, j;
i= 10;
j= i++;

// i= 11, j= 10

int i, j, no;

for (i= 0, j= 0;i<= 3;j= i++) {// or j= ++i
    no= no + i + j;
    // print i, j, no= ???
}

// print no= ???
*/

var str4:String? = "午安"

str4?.hashValue.description

let result6 = str4!.hashValue

//tuple 元祖
let 盒子1 = (5, 4, 3, "紙盒")
let 體積1 = (盒子1.0 * 盒子1.1 * 盒子1.2 )

let 盒子2 = (長:5, 寬:4, 高:3, "紙盒")
let 體積2 = (盒子2.長 * 盒子2.寬 * 盒子2.高 )


var fruits = ["A", "B", "C"]
fruits.append("D")
fruits.count

let fruits2:[String] = ["APPLE","BANANA"]

var fruits3:[String]? = ["APPLE","BANANA"]
fruits3 = nil

var item1:[AnyObject]?
var item2 = [AnyObject]()
item2.append("hihi")
item2.append(123)
item2.append(UIButton())

fruits += fruits2
fruits.count

var prices = ["雞排便當":80, "雞腿便當":85, "烤肉便當":90]
prices.updateValue(60, forKey: "陽春便當")
prices["香腸便當"] = 75
prices

let price = prices["香腸便當"]
let buyFood = "我要買一個香腸便當，需要\(prices["香腸便當"])元"

var price2 = [String:Int]()
price2["雞排便當"] = 80

var item3 = [String:AnyObject]()
item3["項目一"] = 123
item3["項目二"] = UIButton()

var array1 = [String]()
var array2 = Array<String>()

var dictionary1 = [String:Int]()

//泛型
var dictionary2 = Dictionary<String,Int>()

//二維的Array
var twoDiemsionArray = [[Int]]()
var twoDiemsionArray2 = Array<Array<Int>>()

var twoDiemsionDic = [String:[String:Int]]()
var twoDiemsionDic2 = [String:[Int]]()
var twoDiemsionDic3 = Dictionary<String,Dictionary<String,Int>>()

var twoDiemsionDic4 = Dictionary<String,Array<Int>>()

//吃的是Array
twoDiemsionArray.append([123,456])

var set1 = Set(["ObjC", "C", "Java", "C++", "Swift"])
set1.count
set1.insert("C")
set1.count

var number10 = 15

if number10 > 10
{
    number10 += 6
}
else
{
    number10 -= 5
}

number10

//空格的重要性number10 != 10
if number10 != 10
{
    number10 = 100
}
else
{
    number10 = 200
}
/* Wrong Syntax
if(number10 == 10)
    number10 = 100
else
    number10 = 200
*/

number10 = 5
if number10 != 0
{
    //true
    number10 += 10
}
else
{
    //false
}


var number11:Int? = 10

//自動解包
if let number11 = number11
{   //number11 != nil
    let result = "結果是: \(number11)"
}
else
{
    //number11 == nil
    let result = "結果是nil"
}

var number12 = 0
var total1 = 0

while number12 < 50
{
    total1 += number12
    number12 += 1
}

total1

repeat
{
    total1 += number12
    number12 += 1
}   while number12 < 50

total1

total1 = 0

for i in 0..<30
{
    total1 += i
}
total1
total1 = 0

for i in 0...30
{
    total1 += i
}
total1

var result10 = ""
for fruit in fruits
{
    result10 += "I like \(fruit),"
    
}

result10

let inputString = "我愛吃蘋果"
result10 = ""

//第一次 我
//第二次 愛我
//....
for character in inputString.characters{
    
    result10 = String(character) + result10
}

result10

let inputNumber = 3
var result11 = ""

//一定要有default
switch inputNumber
{
    case 0:
    result11 = "零"
    case 1:
    result11 = "壹"
    case 2:
    result11 = "二"
    
    default:
    result11 = "五"
}

result11


let box = (5,4,3,"名字")
result11 = ""

switch box
{
case let (w,h,d,name) where w == h && h == d:
    result11 = "正方形"
case let (w,h,d,name) where w > h || h < d:
    result11 = "長方形"
default:
    result11 = "未知"
    
}
result11









