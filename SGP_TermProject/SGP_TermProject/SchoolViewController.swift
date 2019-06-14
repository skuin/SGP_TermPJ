//
//  SchoolViewController.swift
//  SGP_TermProject
//
//  Created by kpugame on 2019. 6. 15..
//  Copyright © 2019년 JEONGUN JO. All rights reserved.
//

import UIKit

class SchoolViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var schoolPickerView: UIPickerView!
    
    @IBAction func doneToSchoolViewController(segue:UIStoryboardSegue){
        
    }

    var schoolPickerDataSource = ["수원시","성남시","용인시","안양시","과천시","광명시","군포시","부천시", "안성시","의왕시","평택시","여주시","고양시","남양주시","양주시","가평군","양평군"]
    
    var addrName : String = "%EC%88%98%EC%9B%90%EC%8B%9C"
    
    var url : String = "https://openapi.gg.go.kr/DreamChildenSafetySchool?KEY=66e6ad31178f4486a919b5300fa6fe99&pIndex=1&pSize=100&SIGUN_NM="
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return schoolPickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return schoolPickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0{
            addrName = "%EC%88%98%EC%9B%90%EC%8B%9C" // 수원시
        } else if row == 1{
            addrName = "%EC%84%B1%EB%82%A8%EC%8B%9C" // 성남시
        } else if row == 2{
            addrName = "%EC%9A%A9%EC%9D%B8%EC%8B%9C" // 용인시
        } else if row == 3{
            addrName = "%EC%95%88%EC%96%91%EC%8B%9C" // 안양시
        } else if row == 4{
            addrName = "%EA%B3%BC%EC%B2%9C%EC%8B%9C" // 과천시
        } else if row == 5{
            addrName = "%EA%B4%91%EB%AA%85%EC%8B%9C" // 광명
        } else if row == 6{
            addrName = "%EA%B5%B0%ED%8F%AC%EC%8B%9C" // 군포
        } else if row == 7{
            addrName = "%EB%B6%80%EC%B2%9C%EC%8B%9C" // 부천
        } else if row == 8{
            addrName = "%EC%95%88%EC%84%B1%EC%8B%9C" // 안성
        } else if row == 9{
            addrName = "%EC%9D%98%EC%99%95%EC%8B%9C" // 의왕
        } else if row == 10{
            addrName = "%ED%8F%89%ED%83%9D%EC%8B%9C" // 평택
        } else if row == 11{
            addrName = "%EC%97%AC%EC%A3%BC%EC%8B%9C" // 여주
        } else if row == 12{
            addrName = "%EA%B3%A0%EC%96%91%EC%8B%9C" // 고양
        } else if row == 13{
            addrName = "%EB%82%A8%EC%96%91%EC%A3%BC%EC%8B%9C" // 남양주
        } else if row == 14{
            addrName = "%EC%96%91%EC%A3%BC%EC%8B%9C" // 양주
        } else if row == 15{
            addrName = "%EA%B0%80%ED%8F%89%EA%B5%B0" // 가평군
        } else if row == 16{
            addrName = "%EC%96%91%ED%8F%89%EA%B5%B0" // 양평군
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.schoolPickerView.delegate = self
        self.schoolPickerView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sequeToSchool"{
            if let navController = segue.destination as? UINavigationController{
                if let schoolTableViewController = navController.topViewController as? SchoolTableViewController{
                    schoolTableViewController.url = url + addrName
                }
            }
        }
    }
}
