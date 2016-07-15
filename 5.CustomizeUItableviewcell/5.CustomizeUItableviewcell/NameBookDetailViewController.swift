//
//  NameBookDetailViewController.swift
//  5.CustomizeUItableviewcell
//
//  Created by Financialbrain on 2016/7/9.
//  Copyright © 2016年 DarisCode. All rights reserved.
//

import UIKit

class NameBookDetailViewController: UIViewController {
    
    @IBOutlet var NameBookImageView:UIImageView!
    var NameBookImage=""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Load Image and Setting
        NameBookImageView.image = UIImage(named: NameBookImage)
        
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
 

}
