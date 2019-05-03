//
//  MultipleDropDownViewController.swift
//  MakeDropDown
//
//  Created by ems on 02/05/19.
//  Copyright © 2019 Majesco. All rights reserved.
//

import UIKit

class MultipleDropDownViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    //MARK: - Variables
    var cityDropDown = MakeDropDown()
    var numberDropDown = MakeDropDown()
    var dropDownRowHeight:CGFloat = 50
    
    var cityDropDownIdentifier: String = "CITY_DROP_DOWN"
    var numberDropDownIdentifier: String = "NUMBER_DROP_DOWN"
    
    var cityArr: [CityModel] = [CityModel]()
    var numberArr: [String] = [String]()
    
    //MARK: - Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGestures()
        populateDropDownArrays()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpCityDropDown()
        setUpNumberDropDown()
    }
    
    //MARK: - Setup Methods
    func setUpCityDropDown(){
        cityDropDown.makeDropDownIdentifier = self.cityDropDownIdentifier
        cityDropDown.cellReusableIdentifier = "dropDownCell"
        cityDropDown.makeDropDownDataSourceProtocol = self
        cityDropDown.setUpDropDown(viewPositionReference: (cityNameLabel.frame), offset: 5)
        cityDropDown.nib = UINib(nibName: "DropDownTableViewCell", bundle: nil)
        cityDropDown.setRowHeight(height: self.dropDownRowHeight)
        self.view.addSubview(cityDropDown)
    }
    
    func setUpNumberDropDown(){
        numberDropDown.makeDropDownIdentifier = self.numberDropDownIdentifier
        numberDropDown.cellReusableIdentifier = "numberDropDownCell"
        numberDropDown.makeDropDownDataSourceProtocol = self
        numberDropDown.setUpDropDown(viewPositionReference: (numberLabel.frame), offset: 5)
        numberDropDown.nib = UINib(nibName: "DropDownTwoTableViewCell", bundle: nil)
        numberDropDown.setRowHeight(height: self.dropDownRowHeight)
        self.view.addSubview(numberDropDown)
    }
    
    //MARK: - Gesture Setup
    func setUpGestures(){
        self.cityNameLabel.isUserInteractionEnabled = true
        let cityNameLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(cityNameLabelTapped))
        self.cityNameLabel.addGestureRecognizer(cityNameLabelTapGesture)
        
        self.numberLabel.isUserInteractionEnabled = true
        let numberLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(numberLabelTapped))
        self.numberLabel.addGestureRecognizer(numberLabelTapGesture)
    }
    
    //MARK: - Populate Data
    func populateDropDownArrays(){
        
            let cityModel1 = CityModel(cityName: "Shanghai", countryName: "China")
            let cityModel2 = CityModel(cityName: "Istanbul", countryName: "Turkey")
            let cityModel3 = CityModel(cityName: "Dhaka", countryName: "Bangladesh")
            let cityModel4 = CityModel(cityName: "Tokyo", countryName: "Japan")
            let cityModel5 = CityModel(cityName: "Moscow", countryName: "Russia")
            let cityModel6 = CityModel(cityName: "Mumbai", countryName: "India")
            let cityModel7 = CityModel(cityName: "Seoul", countryName: "South Korea")
            let cityModel8 = CityModel(cityName: "London", countryName: "England")
            let cityModel9 = CityModel(cityName: "New York", countryName: "Usa")
            let cityModel10 = CityModel(cityName: "Berlin", countryName: "Germany")
            
            self.cityArr.append(cityModel1)
            self.cityArr.append(cityModel2)
            self.cityArr.append(cityModel3)
            self.cityArr.append(cityModel4)
            self.cityArr.append(cityModel5)
            self.cityArr.append(cityModel6)
            self.cityArr.append(cityModel7)
            self.cityArr.append(cityModel8)
            self.cityArr.append(cityModel9)
            self.cityArr.append(cityModel10)
        
            self.numberArr.append("One")
            self.numberArr.append("Two")
            self.numberArr.append("Three")
            self.numberArr.append("Four")
            self.numberArr.append("Five")
            self.numberArr.append("Six")
            self.numberArr.append("Seven")
            self.numberArr.append("Eight")
            self.numberArr.append("Nine")
            self.numberArr.append("Ten")
        
    }
    
    
    //MARK: - Selector Methods
    @objc func cityNameLabelTapped(){
        self.cityDropDown.showDropDown(height: self.dropDownRowHeight * 5)
    }
    
    @objc func numberLabelTapped(){
        self.numberDropDown.showDropDown(height: self.dropDownRowHeight * 4)
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

extension MultipleDropDownViewController: MakeDropDownDataSourceProtocol{
    func getDataToDropDown(cell: UITableViewCell, indexPos: Int, makeDropDownIdentifier: String) {
        if makeDropDownIdentifier == self.cityDropDownIdentifier{
            let cityDropDownCell = cell as! DropDownTableViewCell
            cityDropDownCell.cityNameLabel.text = self.cityArr[indexPos].cityName
            cityDropDownCell.countryNameLabel.text = self.cityArr[indexPos].countryName
        }
        else{
            let numberDropDownCell = cell as! DropDownTwoTableViewCell
            numberDropDownCell.numberLabel.text = self.numberArr[indexPos]
        }
    }
    
    func numberOfRows(makeDropDownIdentifier: String) -> Int {
        if makeDropDownIdentifier == self.cityDropDownIdentifier{
            return self.cityArr.count
        }else{
            return self.numberArr.count
        }
    }
    
    func selectItemInDropDown(indexPos: Int, makeDropDownIdentifier: String) {
        if makeDropDownIdentifier == self.cityDropDownIdentifier{
            self.cityNameLabel.text = "Country: \(self.cityArr[indexPos].countryName) City: \(self.cityArr[indexPos].cityName)"
            self.cityDropDown.hideDropDown()
        }else{
            self.numberLabel.text = numberArr[indexPos]
            self.numberDropDown.hideDropDown()
        }
    }
    
}
