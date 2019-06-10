//
//  KindergartenTableViewController.swift
//  SGP_TermProject
//
//  Created by kpugame on 2019. 6. 1..
//  Copyright © 2019년 JEONGUN JO. All rights reserved.
//

import UIKit

class KindergartenTableViewController: UITableViewController, XMLParserDelegate {

    @IBOutlet var tbData: UITableView!
    
    var url : String?
    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var chidName = NSMutableString()
    var chidAddr = NSMutableString()
    
    var posx = NSMutableString()
    var posy = NSMutableString()
    
    var kidername = ""
    var kidername_utf8 = ""
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string:url!))!)!
        parser.delegate = self
        parser.parse()
        tbData!.reloadData()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if(elementName as NSString).isEqual(to: "row")
        {
            elements = NSMutableDictionary()
            elements = [:]
            chidName = NSMutableString()
            chidName = ""
            chidAddr = NSMutableString()
            chidAddr = ""
            posx = NSMutableString()
            posx = ""
            posy = NSMutableString()
            posy = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "FACLT_NM"){
            chidName.append(string)
        } else if element.isEqual(to: "REFINE_ROADNM_ADDR"){
            chidAddr.append(string)
        } else if element.isEqual(to: "REFINE_WGS84_LOGT"){
            posx.append(string)
        } else if element.isEqual(to: "REFINE_WGS84_LAT"){
            posy.append(string)
        } 
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "row")
        {
            if !chidName.isEqual(nil){
                elements.setObject(chidName, forKey: "FACLT_NM" as NSCopying)
            }
            if !chidAddr.isEqual(nil){
                elements.setObject(chidAddr, forKey: "REFINE_ROADNM_ADDR" as NSCopying)
            }
            if !posx.isEqual(nil){
                elements.setObject(posx, forKey: "REFINE_WGS84_LOGT" as NSCopying)
            }
            if !posy.isEqual(nil){
                elements.setObject(posy, forKey: "REFINE_WGS84_LAT" as NSCopying)
            }
            
            posts.add(elements)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "FACLT_NM") as! NSString as String
        
        return cell
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToMapView"{
            if let mapViewController = segue.destination as? MapViewController{
                mapViewController.posts = posts
            }
        }
        
        if segue.identifier == "sequeToKiderDetail" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                kidername = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "FACLT_NM") as! NSString as String
                // url 에서 한글을 쓸 수 있도록 코딩
                kidername_utf8 = kidername.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
                // 선택한 row의 병원명을 추가하여 url 구성하고 넘겨줌
                if let detailKiderTableViewController = segue.destination as? DetailKidergartenTableViewController {
                    detailKiderTableViewController.url = url! + "&FACLT_NM=" + kidername_utf8
                }
            }
        }
    }
    

}
