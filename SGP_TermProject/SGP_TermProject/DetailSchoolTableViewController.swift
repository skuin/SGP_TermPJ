//
//  DetailKidergartenTableViewController.swift
//  SGP_TermProject
//
//  Created by kpugame on 2019. 6. 2..
//  Copyright © 2019년 JEONGUN JO. All rights reserved.
//

import UIKit

class DetailSchoolTableViewController: UITableViewController, XMLParserDelegate {
    
    @IBOutlet var detailTableView: UITableView!
    
    // HospitalTableViewController로 부터 segue를 통해 전달 받은 OpenAPI url 주소
    var url : String?
    
    // xml파일을 다운로드 및 파싱하는 오브젝트
    var parser = XMLParser()
    // feed 데이터를 저장하는 mutable array : 병원이 1개이므로 item이 1개
    // 11개 정보를 저장하는 array
    let postname : [String] = ["이름", "시군명", "학생수", "응급키트유무", "안심학교 인증 여부"]
    var posts : [String] = ["","","","",""]
    // dictionary 는 사용하지 않음
    // var elements = NSMutableDictionary()
    var element = NSString()
    // 저장 문자열 변수
    var chidName = NSMutableString()
    var chidAddr = NSMutableString()
    var stuNum = NSMutableString()
    var EMGNCY_SUPPLY_YN     = NSMutableString()
    var SAFETY_SCHOOL_CERTFIY_YN = NSMutableString()
    
    // parser 오브젝트 초기화하고 XMLParserDelegate로 설정하고 XML 파싱 시작
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string:url!))!)!
        parser.delegate = self
        parser.parse()
        detailTableView!.reloadData()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "row")
        {
            posts = ["","","","",""]
            
            chidName = NSMutableString()
            chidName = ""
            stuNum = NSMutableString()
            stuNum = ""
            chidAddr = NSMutableString()
            chidAddr = ""
            EMGNCY_SUPPLY_YN = NSMutableString()
            EMGNCY_SUPPLY_YN = ""
            SAFETY_SCHOOL_CERTFIY_YN = NSMutableString()
            SAFETY_SCHOOL_CERTFIY_YN = ""
            
        }
    }
    
    // 병원 정보 11개를 완성 이름(yadmNm)과 주소(addr) 등
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "SAFETY_SCHOOL_NM"){
            chidName.append(string)
        } else if element.isEqual(to: "STUDNT_CNT"){
            stuNum.append(string)
        } else if element.isEqual(to: "SIGUN_NM"){
            chidAddr.append(string)
        } else if element.isEqual(to: "EMGNCY_SUPPLY_YN"){
            EMGNCY_SUPPLY_YN.append(string)
        } else if element.isEqual(to: "SAFETY_SCHOOL_CERTFIY_YN"){
            SAFETY_SCHOOL_CERTFIY_YN.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "row")
        {
            if !chidName.isEqual(nil){
                posts[0] = chidName as String
            }
            if !chidAddr.isEqual(nil){
                posts[1] = chidAddr as String
            }
            if !stuNum.isEqual(nil){
                posts[2] = stuNum as String
            }
            if !EMGNCY_SUPPLY_YN.isEqual(nil){
                posts[3] = EMGNCY_SUPPLY_YN as String
            }
            if !SAFETY_SCHOOL_CERTFIY_YN.isEqual(nil){
                posts[4] = SAFETY_SCHOOL_CERTFIY_YN as String
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beginParsing()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath)
        
        cell.textLabel?.text = postname[indexPath.row] //11개정보 타이틀
        cell.detailTextLabel?.text = posts[indexPath.row] // 11개 정보 값
        
        return cell
    }
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
