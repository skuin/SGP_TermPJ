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
        if(elementName as NSString).isEqual(to: "list")
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
        if element.isEqual(to: "chidName"){
            chidName.append(string)
        } else if element.isEqual(to: "chidAddr"){
            chidAddr.append(string)
        } else if element.isEqual(to: "posx"){
            posx.append(string)
        } else if element.isEqual(to: "posy"){
            posy.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "list")
        {
            if !chidName.isEqual(nil){
                elements.setObject(chidName, forKey: "chidName" as NSCopying)
            }
            if !chidAddr.isEqual(nil){
                elements.setObject(chidAddr, forKey: "chidAddr" as NSCopying)
            }
            if !posx.isEqual(nil){
                elements.setObject(posx, forKey: "posx" as NSCopying)
            }
            if !posy.isEqual(nil){
                elements.setObject(posy, forKey: "posy" as NSCopying)
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
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "chidName") as! NSString as String
        
        return cell
    }
 

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

    
    // MARK: - Navigation

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
                kidername = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "chidName") as! NSString as String
                // url 에서 한글을 쓸 수 있도록 코딩
                kidername_utf8 = kidername.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
                // 선택한 row의 병원명을 추가하여 url 구성하고 넘겨줌
                if let detailKiderTableViewController = segue.destination as? DetailKidergartenTableViewController {
                    detailKiderTableViewController.url = url! + "&chidName=" + kidername_utf8
                }
            }
        }
    }
    

}
