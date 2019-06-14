//
//  KindergartenTableViewController.swift
//  SGP_TermProject
//
//  Created by kpugame on 2019. 6. 1..
//  Copyright © 2019년 JEONGUN JO. All rights reserved.
//

import UIKit

class SchoolTableViewController: UITableViewController, XMLParserDelegate {
    
    @IBOutlet var tbSchoolData: UITableView!
    
    var url : String?
    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var chidName = NSMutableString()
    
    var kidername = ""
    var kidername_utf8 = ""
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string:url!))!)!
        parser.delegate = self
        parser.parse()
        tbSchoolData!.reloadData()
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
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "SAFETY_SCHOOL_NM"){
            chidName.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "row")
        {
            if !chidName.isEqual(nil){
                elements.setObject(chidName, forKey: "SAFETY_SCHOOL_NM" as NSCopying)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath)
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "SAFETY_SCHOOL_NM") as! NSString as String
        
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sequeToSchoolDetail" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                kidername = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "SAFETY_SCHOOL_NM") as! NSString as String
                // url 에서 한글을 쓸 수 있도록 코딩
                kidername_utf8 = kidername.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
                if let detailSchoolTableViewController = segue.destination as? DetailSchoolTableViewController {
                    detailSchoolTableViewController.url = url! + "&SAFETY_SCHOOL_NM=" + kidername_utf8
                }
            }
        }
    }
    
    
}
