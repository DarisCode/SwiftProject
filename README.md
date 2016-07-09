##刪除 更新畫面
>tableView.reloadData()

##更改顏色

```swift
shareAction.backgroundColor  = UIColor(colorLiteralRed: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
deleteAction.backgroundColor = UIColor(colorLiteralRed: 100.0/255.0, green:100.0/255.0, blue: 100.0/255.0, alpha: 1.0)
```

##警示選單中間部分
```swift
 override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        /*OptionMenu*/
    
        //Alert Bottom
//        let optionMenu = UIAlertController(title: nil, message: "This is UIAlertController", preferredStyle:  .ActionSheet)
        
        //Alert Center
        let optionMenu = UIAlertController(title: nil, message: "This is UIAlertController", preferredStyle:  .Alert)
        
        //UIAlertAction
        //handler means do -> (function)
        
        // Alert left
        let cancelAction = UIAlertAction(title: "Cancel", style:  .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        let callActionHandler =
        { (action:UIAlertAction!) -> Void in
            
            
            let alertmessage = UIAlertController(title: "service unavialable", message: "sorry, this call is not availble yet. Please retry letter", preferredStyle: .Alert)
            
            alertmessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertmessage, animated: true, completion: nil)
        
        }
        
        
        
        // Alert Right 
        // if you choose call than execute callActionHandler
        let callAction = UIAlertAction(title: "Call", style: .Default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        `
        
        //Show Menu
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        
    }
```

##Segue
先建立一個類別<br>
NamebookDetailController(繼承UIViewController)<br>
然後將Cell連接到一個新創的ViewController 放上一個imageView <br>
然後使用show將Cell與ViewController然後此ViewController class選NamebookDetailController<br>
<br>
####NamebookDetailController

```swift
 @IBOutlet var NameBookImageView:UIImageView!
    var NameBookImage=""

```
####NameBookTableViewController

```swift
 
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
```
