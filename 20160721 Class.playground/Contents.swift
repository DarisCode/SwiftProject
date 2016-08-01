//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//1
class 人
{
    var name = "無名氏"
    var 身高公分 = 170.0
    var weight = 70
    
    var 身高英吋:Double
    {
        set
        {
            身高公分 = newValue * 2.54
        }
        get
        {
            return 身高公分 / 2.54
        }
    }
    
    var 理想體重公斤差異值 = 0.0 //JG
    var 體重公斤 = 70.0
    {
        //Differ with OBJC setter getter
        willSet
        {
            print("體重即將從\(體重公斤)變成\(newValue)")
        }
        didSet
        {
            print("體重即將從\(oldValue)變成\(體重公斤)")
            
            理想體重公斤差異值 = 身高公分 - 110 - 體重公斤
        }
    }
    
    lazy var BMI:Double =
    {
        return 30.0
    }()
    
    private(set) var birthday = "1977/7/7"
    //Beside this class could not read and write this value
    private var 住址 = "..."
    
    
    
}

let joe = 人()
joe.name = "Joe"
joe.身高英吋 = 100
joe.身高英吋
joe.身高公分
joe.體重公斤 = 60
joe.理想體重公斤差異值
joe.體重公斤 = 70
joe.理想體重公斤差異值
joe.birthday = "1988/8/8"

//2
class Car
{
    var 品牌 = ""
    var 型號 = ""
/*
    init(brand:String, model:String)
    {
        品牌 = brand
        型號 = model
        
    }
 */
    init(brand:String = "UNKNOWN", model:String = "UNKNOWN")
    {
        品牌 = brand
        型號 = model
        
    }
/*
    //convenience init()
    convenience init()
    {
        self.init(brand:"未知", model:"未知")
    }
    
    convenience init(brand:String)
    {
        self.init(brand:"未知", model:"未知")
    }
*/
    
    
    class 輪胎
    {
        var 品牌 = ""
        var 尺寸 = ""
        
    }
    
    class func carWithToyota() -> Car
    {
        let result = Car()
        result.品牌 = "Toyota"
        
        return result
    }
    
    func 自我介紹() -> String
    {
        return "我是\(品牌)的\(型號)車子"
    }
    
    //deinit
    deinit
    {
        //
    }
}

let car1 = Car()
car1.品牌 = "YAMAHA"
car1.型號 = "YARIS"
car1.自我介紹()

let car2 = Car.carWithToyota()
car2.自我介紹()


let tire1 = Car.輪胎()

let car3 = Car(brand: "BMW")
let car4 = Car(brand: "BMW", model: "C300")
let car5 = Car()
let car6 = Car(brand: "BMW")
let car7 = Car(model: "C300")
let car8 = Car(brand: "C300", model: "C300")






