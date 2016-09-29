//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

import AVFoundation

let url = NSURL(string: "/banana.caf")

/// Must Do/try/Catch

/* --Wrong--
 
 let player:AVAudioPlayer?  = AVAudioPlayer(contentsOfURL: url!)
*/

/*  Right  */

let player:AVAudioPlayer?

do
{
    player = try AVAudioPlayer(contentsOfURL: url!)
}
catch
{
    print("Error: \(error)")
}

/// take optional type
let player2 = try? AVAudioPlayer(contentsOfURL: url!)

/// if successful take non-optional type
//let player3 = try! AVAudioPlayer(contentsOfURL: url!)

enum CarBroken:ErrorType
{
    case non_electric
    case non_oil
    case non_tire
}


class 機車
{
    var 電瓶電壓 = 11.0 //v
    var 汽油 = 0.05 //百分比
    func 發動汽車() throws
    {
        
        if 電瓶電壓 < 10.0
        {
            throw CarBroken.non_electric
        }
        
        if 汽油 < 0.1
        {
            throw CarBroken.non_oil
        }
        
        print("成功發動！")
        
    }
}

let moto = 機車()
do{
    try moto.發動汽車()
}
catch CarBroken.non_oil
{
    print("請進場檢查")
}
catch CarBroken.non_tire
{
    print("請加油!")
}


