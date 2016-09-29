//
//  MasterViewController.swift
//  DropBox
//
//  Created by Financialbrain on 2016/7/29.
//  Copyright © 2016年 DarisCode. All rights reserved.
//

import UIKit
import SwiftyDropbox

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [String]()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.navigationItem.leftBarButtonItem = self.editButtonItem()
//
//        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(insertNewObject(_:)))
//        self.navigationItem.rightBarButtonItem = addButton
        
        let linkBtn = UIBarButtonItem(title: "Link", style: .Plain, target: self, action: #selector(linkBtnPressed(_:)))
        self.navigationItem.rightBarButtonItem = linkBtn
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        // Try to download file list if possible
        downloadFileList()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(downloadFileList), name: DB_Linked_SUSSESSFULLY, object: nil)
    }
    
    
    
    func downloadFileList()
    {
        // Singleton的寫法，在Dropbox裡面要用到就這樣寫
        if let client = Dropbox.authorizedClient
        {
            //Use Add Button and Edit Button to replace Link Button
            
            self.navigationItem.leftBarButtonItem = self.editButtonItem()
            let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(insertNewObject(_:)))
            self.navigationItem.rightBarButtonItem = addButton
            
            
            // Get file list
            objects.removeAll()
            
            
            client.files.listFolder(path: "").response()
            { (response, error) in
                
                if let result = response
                {
                    print("Folder Contents:")
                    for entry in result.entries
                    {
                        print(entry.name)
                        self.objects.append(entry.name)
                    }
                    self.tableView.reloadData()
                }

                else
                {
                    print("Error : \(error)")
                }
            }
            
        }
    }
    
    //Login
    func linkBtnPressed(sender: AnyObject)
    {
        Dropbox.authorizeFromController(self)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject)
    {
        if let client = Dropbox.authorizedClient
        {
            guard let sourceFileURL = NSBundle.mainBundle().URLForResource("disneylandcastle.png", withExtension: nil)
            else
            {
                return
            }
            
            let targetFilePathName = "/" + NSDate.description() + ".png"
            //body也可以改成input SDK問題
            client.files.upload(path: targetFilePathName, body: sourceFileURL).response{(response, error) in
                
                if let metadata = response
                {
                    print("Upload Susscessfully :\(metadata.name)")
                    self.downloadFileList()
                }
                else
                {
                    print("Upload Error :\(error)")
                }
            }
        }
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete
        {
            
            if let client = Dropbox.authorizedClient
            {
                let targetFilePathName = "/" + objects[indexPath.row]
                
                client.files.delete(path: targetFilePathName).response()
                { (response, error) in
                    
                    if let metadata = response
                    {
                        print("Delete successfully: \(metadata.name)")
                        self.downloadFileList()
                    }
                    else
                    {
                        print("Delete Error: \(error)")
                    }
                }
            }
            
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

