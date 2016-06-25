//
//  ViewController.swift
//  4TableView
//
//  Created by Financialbrain on 2016/6/24.
//  Copyright © 2016年 DarisCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //回傳總列數
        //總共看陣列有幾個物件就回傳幾列
        return studentNames.count

    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        //重複利用表格內用有的cell但顯示不同的物件
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        //設定Cell
        cell.textLabel?.text = studentNames[indexPath.row]
        
        return cell
    }
    
        
}



var studentNames = ["Daris", "John", "Nolan", "Beryl", "Monica", "Jason", "Joe"]




