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
    
    var url : String = "https://openapi.gg.go.kr/ChildhouseKndrgrM?KEY=d652318810424c3188560a0e4b713aff&pIndex=1&pSize=1000&SIGUN_NM="
    
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
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 안산시
        } else if row == 5{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 과천시
        } else if row == 6{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 광명
        } else if row == 7{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 광주
        } else if row == 8{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 군포
        } else if row == 9{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 부천
        } else if row == 10{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 시흥
        } else if row == 11{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 김포
        } else if row == 12{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 안성
        } else if row == 13{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 오산
        } else if row == 14{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 의왕
        } else if row == 15{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 이천
        } else if row == 16{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 평택
        } else if row == 17{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 하남
        } else if row == 18{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 화성
        } else if row == 19{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 여주
        } else if row == 20{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 고양
        } else if row == 21{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 구리
        } else if row == 22{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 남양주
        } else if row == 23{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 동두천
        } else if row == 24{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 양주
        } else if row == 25{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 의정부
        } else if row == 26{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 파주
        } else if row == 27{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 포천
        } else if row == 28{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 가천군
        } else if row == 29{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 양평군
        } else if row == 30{
            //addrName = "%EB%8D%95%EC%A7%84%EA%B5%AC" // 연천군
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

