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
    
    
    var pickerDataSource = ["전주시","서울시","정읍시","시흥시"]
    
    //var pickerDataSource = ["광진구", "구로구", "동대문구", "종로구"]
    
    var url : String = "http://openapi.jeonju.go.kr/rest/nurserynew/getNurseryList?authApiKey=ybnIgV0VKqAjxonAPCPFPvTtRAKhhARpuEKCRgD7Lx5UNuNc%2B56Bg2OEbpi97TdsSizzYpAetBB1TWTyiO2dvQ%3D%3D&startPage=1&pageSize=10"
    var sgguCd : String = "110023"
    
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
            //sgguCd = "110023"
        } else if row == 1{
            //sgguCd = "110005"
        } else if row == 2{
            //sgguCd = "110007"
        } else /*if row == 0*/{
            //sgguCd = "110016"
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
                    kindergartenTableViewController.url = url
                }
            }
        }
    }

}

