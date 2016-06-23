//
//  ViewController.swift
//  HelloWorld
//
//  Created by Financialbrain on 2016/6/23.
//  Copyright © 2016年 DarisCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showSwiftWorld()
{
        //Swift Main title / message
        let showAlert = UIAlertController(
            
            title: "Swift World",
            message: "Welcome to Swift World",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        
        //Below Alart Message
        showAlert.addAction(
            
            UIAlertAction(
                title: "Finish",
                style: UIAlertActionStyle.Default,
                handler: nil
            )
        )
        //Show
        self.presentViewController(
            showAlert,
            animated: true,
            completion: nil
        )
    }
}


