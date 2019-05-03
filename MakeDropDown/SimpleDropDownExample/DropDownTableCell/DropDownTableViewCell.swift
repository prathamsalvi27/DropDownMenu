//
//  DropDownTableViewCell.swift
//  MakeDropDown
//
//  Created by ems on 02/05/19.
//  Copyright © 2019 Majesco. All rights reserved.
//

import UIKit

class DropDownTableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
