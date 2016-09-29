//
//  DetailViewController.swift
//  DropBox
//
//  Created by Financialbrain on 2016/7/29.
//  Copyright © 2016年 DarisCode. All rights reserved.
//

import UIKit
import SwiftyDropbox

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var photoImageView: UIImageView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    
    func configureView() {
        // Update the user interface for the detail item.
        if let filename = self.detailItem as? String
        {
            if let imageView = self.photoImageView
            {
                if let client = Dropbox.authorizedClient
                {
                    // Prepare temp file's full path
                    let tempPath = NSTemporaryDirectory()
                    let fullTempFileNameURL = NSURL(fileURLWithPath: tempPath + "/tmp.jpg")
                    
                    let destination : (NSURL,NSHTTPURLResponse) -> NSURL =
                        
                    {
                        tempURL, response in return fullTempFileNameURL
                    }
                    
                    client.files.download(path: "/" + filename, destination: destination).response()
                    { (response, error) in
                        
                        if let (metadata, url) = response
                        {
                            print("Donwload file succsssfully: \(metadata.name)")
                            let fileData = NSData(contentsOfURL: url)
                            let image = UIImage(data: fileData!)
                            imageView.image = image
                          
                            // Remove temp file
                            do
                            {
                                try NSFileManager.defaultManager().removeItemAtURL(url)
                            }
                            catch
                            {
                                print("Delete File fail: \(error)")
                            }
                        }
                        else
                        {
                                print("Download Fail:\(error)")
                        }
                    }
                    
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

