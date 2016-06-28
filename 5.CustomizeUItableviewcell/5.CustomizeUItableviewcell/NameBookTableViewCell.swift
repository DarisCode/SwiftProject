//
//  NameBookTableViewCell.swift
//  5.CustomizeUItableviewcell
//
//  Created by Financialbrain on 2016/6/25.
//  Copyright © 2016年 DarisCode. All rights reserved.
//

import UIKit

class NameBookTableViewCell: UITableViewCell {
    
    @IBOutlet var DetailLabel: UILabel!
    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var thumbImageView: UIImageView!
    @IBOutlet var arrowView: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
