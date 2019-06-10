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

    var pickerDataSource = ["수원시","성남시","용인시","안양시","안산시","과천시","광명시","광주시","군포시","부천시","시흥시","김포시","안성시","오산시","의왕시","이천시","평택시","하남시","화성시","여주시","고양시","구리시","남양주시","동두천시","양주시","의정부시","파주시","포천시","가평군","양평군","연천군"]
    
    var addrName : String = "%EC%88%98%EC%9B%90%EC%8B%9C"
    
    var url : String = "https://openapi.gg.go.kr/ChildhouseKndrgrM?KEY=d652318810424c3188560a0e4b713aff&pIndex=1&pSize=100&SIGUN_NM="
    
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
            addrName = "%EC%88%98%EC%9B%90%EC%8B%9C" // 수원시
        } else if row == 1{
            addrName = "%EC%84%B1%EB%82%A8%EC%8B%9C" // 성남시
        } else if row == 2{
            addrName = "%EC%9A%A9%EC%9D%B8%EC%8B%9C" // 용인시
        } else if row == 3{
            addrName = "%EC%95%88%EC%96%91%EC%8B%9C" // 안양시
        } else if row == 4{
            addrName = "%EC%95%88%EC%82%B0%EC%8B%9C" // 안산시
        } else if row == 5{
            addrName = "%EA%B3%BC%EC%B2%9C%EC%8B%9C" // 과천시
        } else if row == 6{
            addrName = "%EA%B4%91%EB%AA%85%EC%8B%9C" // 광명
        } else if row == 7{
            addrName = "%EA%B4%91%EC%A3%BC%EC%8B%9C" // 광주
        } else if row == 8{
            addrName = "%EA%B5%B0%ED%8F%AC%EC%8B%9C" // 군포
        } else if row == 9{
            addrName = "%EB%B6%80%EC%B2%9C%EC%8B%9C" // 부천
        } else if row == 10{
            addrName = "%EC%8B%9C%ED%9D%A5%EC%8B%9C" // 시흥
        } else if row == 11{
            addrName = "%EA%B9%80%ED%8F%AC%EC%8B%9C" // 김포
        } else if row == 12{
            addrName = "%EC%95%88%EC%84%B1%EC%8B%9C" // 안성
        } else if row == 13{
            addrName = "%EC%98%A4%EC%82%B0%EC%8B%9C" // 오산
        } else if row == 14{
            addrName = "%EC%9D%98%EC%99%95%EC%8B%9C" // 의왕
        } else if row == 15{
            addrName = "%EC%9D%B4%EC%B2%9C%EC%8B%9C" // 이천
        } else if row == 16{
            addrName = "%ED%8F%89%ED%83%9D%EC%8B%9C" // 평택
        } else if row == 17{
            addrName = "%ED%95%98%EB%82%A8%EC%8B%9C" // 하남
        } else if row == 18{
            addrName = "%ED%99%94%EC%84%B1%EC%8B%9C" // 화성
        } else if row == 19{
            addrName = "%EC%97%AC%EC%A3%BC%EC%8B%9C" // 여주
        } else if row == 20{
            addrName = "%EA%B3%A0%EC%96%91%EC%8B%9C" // 고양
        } else if row == 21{
            addrName = "%EA%B5%AC%EB%A6%AC%EC%8B%9C" // 구리
        } else if row == 22{
            addrName = "%EB%82%A8%EC%96%91%EC%A3%BC%EC%8B%9C" // 남양주
        } else if row == 23{
            addrName = "%EB%8F%99%EB%91%90%EC%B2%9C%EC%8B%9C" // 동두천
        } else if row == 24{
            addrName = "%EC%96%91%EC%A3%BC%EC%8B%9C" // 양주
        } else if row == 25{
            addrName = "%EC%9D%98%EC%A0%95%EB%B6%80%EC%8B%9C" // 의정부
        } else if row == 26{
            addrName = "%ED%8C%8C%EC%A3%BC%EC%8B%9C" // 파주
        } else if row == 27{
            addrName = "%ED%8F%AC%EC%B2%9C%EC%8B%9C" // 포천
        } else if row == 28{
            addrName = "%EA%B0%80%ED%8F%89%EA%B5%B0" // 가평군
        } else if row == 29{
            addrName = "%EC%96%91%ED%8F%89%EA%B5%B0" // 양평군
        } else if row == 30{
            addrName = "%EC%97%B0%EC%B2%9C%EA%B5%B0" // 연천군
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

