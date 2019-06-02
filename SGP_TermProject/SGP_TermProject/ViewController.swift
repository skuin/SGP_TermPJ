//
//  ViewController.swift
//  SGP_TermProject
//
//  Created by kpugame on 2019. 6. 1..
//  Copyright © 2019년 JEONGUN JO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func doneToPickerViewController(segue:UIStoryboardSegue){
        
    }
    
    
    var pickerDataSource = ["완산구","덕진구"]
    
    var url : String = "http://openapi.jeonju.go.kr/rest/nurserynew/getNurseryList?authApiKey=ybnIgV0VKqAjxonAPCPFPvTtRAKhhARpuEKCRgD7Lx5UNuNc%2B56Bg2OEbpi97TdsSizzYpAetBB1TWTyiO2dvQ%3D%3D&startPage=1&pageSize=50&chidAddr="
    
    var addrName : String = "%EC%99%84%EC%82%B0%EA%B5%AC"
    
    var urlKimjae : String = "http://openapi.gimje.go.kr/rest/kindergarten/getKindergtList?ServiceKey=ybnIgV0VKqAjxonAPCPFPvTtRAKhhARpuEKCRgD7Lx5UNuNc%2B56Bg2OEbpi97TdsSizzYpAetBB1TWTyiO2dvQ%3D%3D"
    
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
            addrName = "%EC%99%84%EC%82%B0%EA%B5%AC"
        } else if row == 1{
            addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToTableView"{
            if let navController = segue.destination as? UINavigationController{
                if let kindergartenTableViewController = navController.topViewController as? KindergartenTableViewController{
                    kindergartenTableViewController.url = url + addrName
                }
            }
        }
    }

}

