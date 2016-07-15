//
//  NameBookTableViewController.swift
//  5.CustomizeUItableviewcell
//
//  Created by Financialbrain on 2016/6/25.
//  Copyright © 2016年 DarisCode. All rights reserved.
//

import UIKit


class NameBookTableViewController: UITableViewController {

    
    var NameBooks = ["VIX指數"]
    var Detail = ["恐慌指數"]
    var NameBooksImage = ["Push.png"]
    var ArrorImage = ["Arrow.png"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        title = "台股觀測站"
        
               
            }

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    

      /* override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }*/
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NameBooks.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath:indexPath) as! NameBookTableViewCell
        
        cell.TitleLabel?.text = NameBooks[indexPath.row]
        cell.DetailLabel?.text = Detail[indexPath.row]
        cell.thumbImageView?.image = UIImage(named: NameBooksImage[indexPath.row])
        cell.arrowView?.image = UIImage(named: ArrorImage[indexPath.row])
        
        cell.thumbImageView.layer.cornerRadius = 30.0
        cell.thumbImageView.clipsToBounds = true
        return cell
        
    }
//    
    
   
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//    {
//
//        /*OptionMenu*/
//    
//        //Alert Bottom
////        let optionMenu = UIAlertController(title: nil, message: "This is UIAlertController", preferredStyle:  .ActionSheet)
//        
//        //Alert Center
//        let optionMenu = UIAlertController(title: nil, message: "This is UIAlertController", preferredStyle:  .Alert)
//        
//        //UIAlertAction
//        //handler means do -> (function)
//        
//        // Alert left
//        let cancelAction = UIAlertAction(title: "Cancel", style:  .Cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//        
//        let callActionHandler =
//        { (action:UIAlertAction!) -> Void in
//            
//            
//            let alertmessage = UIAlertController(title: "service unavialable", message: "sorry, this call is not availble yet. Please retry letter", preferredStyle: .Alert)
//            
//            alertmessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alertmessage, animated: true, completion: nil)
        
//        }
//
    
//        
//        
//        // Alert Right 
//        // if you choose call than execute callActionHandler
//        let callAction = UIAlertAction(title: "Call", style: .Default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//        
//        
//        //Show Menu
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//        
//        
//    }
    
    //Delete Row
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
//    {
//        
//        if editingStyle == .Delete
//        
//        {
//            NameBooks.removeAtIndex(indexPath.row)
//            Detail.removeAtIndex(indexPath.row)
//            NameBooksImage.removeAtIndex(indexPath.row)
//            ArrorImage.removeAtIndex(indexPath.row)
//        }
//        
//        //Default ReloadData
////        tableView.reloadData()
//        
//        //Delete Animation
//        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        
//    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?
    {
        
        let shareAction = UITableViewRowAction(style: .Default, title: "Share", handler:
            {(action,indexPath)-> Void in
                
                let defaultText = "Just checking in at" + self.NameBooks[indexPath.row]
                
                let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
                
                self.presentViewController(activityController, animated: true, completion: nil)
            })
        
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: {(action, indexPath) -> Void in
            
            
            self.NameBooks.removeAtIndex(indexPath.row)
            self.Detail.removeAtIndex(indexPath.row)
            self.NameBooksImage.removeAtIndex(indexPath.row)
            self.ArrorImage.removeAtIndex(indexPath.row)
            
            //Default ReloadData
            tableView.reloadData()
            

            })
        
        shareAction.backgroundColor = UIColor(colorLiteralRed: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(colorLiteralRed: 100.0/255.0, green:100.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
        
           }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        if segue.identifier == "showNameBookDetail"
        {
            if let indexPath = tableView.indexPathForSelectedRow
            {
                let destinationController = segue.destinationViewController as! NameBookDetailViewController
                destinationController.NameBookImage = NameBooksImage[indexPath.row]
                
            }
            
        }
    }
    
    
  
//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 60
//        
//    }
    
    
    
        // #warning Incomplete implementation, return the number of rows
    
        
    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}