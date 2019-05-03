//
//  ViewController.swift
//  MakeDropDown
//
//  Created by ems on 02/05/19.
//  Copyright © 2019 Majesco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var testLabel: UILabel!
    
    //MARK: - Variables
    let dropDown = MakeDropDown()
    var cityModelArr: [CityModel] = [CityModel]()
    
    var dropDownRowHeight: CGFloat = 50
    
    //MARK: - Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        populateCityModelArray()
        setUpGestures()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Call this in viewDidAppear to get correct frame values
        setUpDropDown()
    }
    
    func setUpDropDown(){
        dropDown.makeDropDownIdentifier = "DROP_DOWN_NEW"
        dropDown.cellReusableIdentifier = "dropDownCell"
        dropDown.makeDropDownDataSourceProtocol = self
        dropDown.setUpDropDown(viewPositionReference: (testLabel.frame), offset: 2)
        dropDown.nib = UINib(nibName: "DropDownTableViewCell", bundle: nil)
        dropDown.setRowHeight(height: self.dropDownRowHeight)
        self.view.addSubview(dropDown)
    }
    
    
    
    
    
    func setUpGestures(){
        self.testLabel.isUserInteractionEnabled = true
        let testLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(testLabelTapped))
        self.testLabel.addGestureRecognizer(testLabelTapGesture)
    }
    
    func populateCityModelArray(){
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
        
        self.cityModelArr.append(cityModel1)
        self.cityModelArr.append(cityModel2)
        self.cityModelArr.append(cityModel3)
        self.cityModelArr.append(cityModel4)
        self.cityModelArr.append(cityModel5)
        self.cityModelArr.append(cityModel6)
        self.cityModelArr.append(cityModel7)
        self.cityModelArr.append(cityModel8)
        self.cityModelArr.append(cityModel9)
        self.cityModelArr.append(cityModel10)
        
    }
    
    //MARK: - Selector Methods
    @objc func testLabelTapped(){
        // Give height to drop down according to requirement
        // In this it will show 5 rows in dropdown as per calculations
        self.dropDown.showDropDown(height: self.dropDownRowHeight * 5)
    }
    
}

extension ViewController: MakeDropDownDataSourceProtocol{
    func getDataToDropDown(cell: UITableViewCell, indexPos: Int, makeDropDownIdentifier: String) {
        if makeDropDownIdentifier == "DROP_DOWN_NEW"{
            let customCell = cell as! DropDownTableViewCell
            customCell.countryNameLabel.text = self.cityModelArr[indexPos].countryName
            customCell.cityNameLabel.text = self.cityModelArr[indexPos].cityName
            print("test")
        }
    }
    
    func numberOfRows(makeDropDownIdentifier: String) -> Int {
        return self.cityModelArr.count
    }
    
    func selectItemInDropDown(indexPos: Int, makeDropDownIdentifier: String) {
        self.testLabel.text = "Country: \(self.cityModelArr[indexPos].countryName) City: \(self.cityModelArr[indexPos].cityName)"
        self.dropDown.hideDropDown()
    }
    
}
