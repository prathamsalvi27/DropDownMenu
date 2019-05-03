//
//  DropDownWithSearchBarViewController.swift
//  MakeDropDown
//
//  Created by ems on 02/05/19.
//  Copyright © 2019 Majesco. All rights reserved.
//

import UIKit
protocol DropDownCellDelegateProtocol{
    func dropDownCellClicked(indexNo: Int)
}
class DropDownWithSearchBarViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var citySearchBar: UISearchBar!
    @IBOutlet weak var selectedCityLabel: UILabel!
    
    //MARK: - Variables
    var cityArr: [String] = ["Shanghai", "Beijing", "Istanbul", "Dhaka", "Tokyo", "Moscow", "Mumbai", "Delhi", "Jakarta", "Seoul", "Mexico City", "London", "New York", "Cairo", "Rio de Janeiro", "Cape Town"]
    var dropDown = MakeDropDown()
    var filteredCityArr: [String] = [String]()
    var dropDownMenuRowHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.citySearchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.dropDown.setUpDropDown(viewPositionReference: self.citySearchBar.frame, offset: 0)
        self.dropDown.cellReusableIdentifier = "numberDropDownCell"
        self.dropDown.nib = UINib(nibName: "DropDownTwoTableViewCell", bundle: nil)
        self.dropDown.setRowHeight(height: dropDownMenuRowHeight)
        self.dropDown.makeDropDownDataSourceProtocol = self
        self.view.addSubview(dropDown)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DropDownWithSearchBarViewController: MakeDropDownDataSourceProtocol{
    func getDataToDropDown(cell: UITableViewCell, indexPos: Int, makeDropDownIdentifier: String) {
        let searchCell = cell as! DropDownTwoTableViewCell
        searchCell.numberLabel.text = self.filteredCityArr[indexPos]
        searchCell.indexPos = indexPos
        searchCell.dropDownCellDelegateProtocol = self
        
    }
    
    func numberOfRows(makeDropDownIdentifier: String) -> Int {
        return self.filteredCityArr.count
    }
    
    
}

extension DropDownWithSearchBarViewController: DropDownCellDelegateProtocol{
    func dropDownCellClicked(indexNo: Int) {
        self.selectedCityLabel.text = filteredCityArr[indexNo]
        self.dropDown.hideDropDown()
    }
    
}

extension DropDownWithSearchBarViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredCityArr = cityArr.filter({($0.lowercased()).contains(searchText.lowercased())})
        
        if filteredCityArr.count > 5{
            self.dropDown.reloadDropDown(height: dropDownMenuRowHeight * 5)
        }else{
            self.dropDown.reloadDropDown(height: CGFloat(dropDownMenuRowHeight * CGFloat(filteredCityArr.count)))
        }
        
    }
}
