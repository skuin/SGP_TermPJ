//
//  SearchViewController.swift
//  SGP_TermProject
//
//  Created by kpugame on 2019. 6. 15..
//  Copyright © 2019년 JEONGUN JO. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchPickerView: UIPickerView!
    
    
    @IBAction func doneToSearchViewController(segue:UIStoryboardSegue){
        
    }
    
    var pickerDataSource = ["민간","사설","국공립","가정"]
    
    var pivName : String = "%EB%AF%BC%EA%B0%84"
    var addName : String = "시흥시"
    
    var url : String = "https://openapi.gg.go.kr/ChildhouseKndrgrM?KEY=d652318810424c3188560a0e4b713aff&pIndex=1&pSize=100&PLVTINST_DIV_NM="
    
    var addrUrl : String = "https://openapi.gg.go.kr/ChildhouseKndrgrM?KEY=d652318810424c3188560a0e4b713aff&pIndex=1&pSize=100&SIGUN_NM="
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0{
            pivName = "%EB%AF%BC%EA%B0%84" // 민간
        } else if row == 1{
            pivName = "%EC%82%AC%EC%84%A4" // 사설
        } else if row == 2{
           pivName = "%EA%B5%AD%EA%B3%B5%EB%A6%BD" // 국공립
        } else if row == 3{
            pivName = "%EA%B0%80%EC%A0%95" // 가정
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.searchPickerView.delegate = self;
        self.searchPickerView.dataSource = self;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSearchTableView"{
            if let navController = segue.destination as? UINavigationController{
                if let kindergartenTableViewController = navController.topViewController as? KindergartenTableViewController{
                    kindergartenTableViewController.url = url + pivName
                }
            }
        }
        if segue.identifier == "segueToLocationTableView"{
            if let navController = segue.destination as? UINavigationController{
                if let kindergartenTableViewController = navController.topViewController as?
                    KindergartenTableViewController{
                    addName = searchTextField.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
                    kindergartenTableViewController.url = addrUrl + addName//searchTextField.text!
                }
            }
        }
    }
    
    
}
