//
//  DropDownTwoTableViewCell.swift
//  MakeDropDown
//
//  Created by ems on 02/05/19.
//  Copyright © 2019 Majesco. All rights reserved.
//

import UIKit

class DropDownTwoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var numberLabel: UILabel!
    
    var dropDownCellDelegateProtocol: DropDownCellDelegateProtocol?
    var indexPos: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setUpGestures()
    }
    
    func setUpGestures(){
        self.numberLabel.isUserInteractionEnabled = true
        let numberLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(numberLabelTapped))
        self.numberLabel.addGestureRecognizer(numberLabelTapGesture)
    }
    
    @objc func numberLabelTapped(){
        self.dropDownCellDelegateProtocol?.dropDownCellClicked(indexNo: self.indexPos!)
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
