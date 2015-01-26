//
//  TableVC.swift
//  table
//
//  Created by CoE on 1/24/2558 BE.
//  Copyright (c) 2558 CoE. All rights reserved.
//

import UIKit


//http://bit.ly/1wvxqDo 
//http://bit.ly/1Eind6c

protocol TableVCDelegate {
    func update(operatorString: String)
    
}

class TableVC: UITableViewController, Add2VCDelegate {

    var items = ["Name"]
   var detailItems = ["Detail"]
    
    func loadDataJsonOnline() {
        let url = NSURL(string: "https://dev.afourleaf.com/dining/example_json/")
        let data = NSData(contentsOfURL: url!)
        let json = JSON(data: data!)
        
        items.removeAll(keepCapacity: false)
        detailItems.removeAll(keepCapacity: false)
        for item in json["output"]{
            var name = item.1["name"].string
            var url	 = item.1["picture_url"].string
          println("Name: " + name! + "\nDetail: " + url!)
          //items.append(["name": name!, "detail": picture_url!])
            items.append(name!)
            detailItems.append(url!)
        }
    }
    
    func selectText(str: String, str2: String) {
        //var str3 = str + str2
        detailItems.append(str2)
        items.append(str)
        tableView.reloadData()
        
        // Save to user default (persistence storage)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(items, forKey: "items")
        defaults.setObject(detailItems, forKey: "detailItems")
        
    }
    
    
    
    @IBAction func updateLabel1(sender: AnyObject) {
        var newVC =  storyboard?.instantiateViewControllerWithIdentifier("id1") as MyControllerViewController
        newVC.labelString = "test"
        navigationController?.pushViewController(newVC, animated: true)
        
        
        var newButton = UIButton(frame: CGRectMake(0, 0, 100, 100))
        
        //delegate?.update("xxx")
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 20
        // NSUserDefaults.resetStandardUserDefaults()
        
        // Save to user default (persistence storage)
        let defaults = NSUserDefaults.standardUserDefaults()
        // defaults.setObject(items, forKey: "items")
        if let savedItems = defaults.objectForKey("items") as? [String] {
            items = savedItems
        }
        if let savedDetailItems = defaults.objectForKey("detailItems") as? [String] {
            detailItems = savedDetailItems
        }
        loadDataJsonOnline()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return items.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath) as UITableViewCell
        var label = cell.viewWithTag(1) as UILabel
        
        var detailLabel = cell.viewWithTag(2) as UILabel
        
        label.text = items[indexPath.row]
        detailLabel.text = detailItems[indexPath.row]
        
        // label.text = items[indexPath.row] + "   " + detailItems[indexPath.row]
        
        
//        var identify = ""
//        switch indexPath.row {
//        case let x where 0 == x%3:
//            identify = "cell1"
//        case let x where 1 == x%3:
//            identify = "cell2"
//        case let x where 2 == x%3:
//            identify = "cell3"
//        default:
//            identify = "cell1"
//        }
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath) as UITableViewCell
//
//        if 0 == indexPath.row%3 {
//            var label = cell.viewWithTag(1) as UILabel
//            label.text = "testing \(indexPath.row)"
//    
//        }
        return cell
    }
    
        var clickRow = "111"
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //if 0 == indexPath.row {
            clickRow = "1"
            performSegueWithIdentifier("link", sender: indexPath)
        
     //   }
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if "link" == segue.identifier {
            var viewController = segue.destinationViewController as MyControllerViewController
            
            if let indexPath = sender as? NSIndexPath {
                viewController.labelString = items[indexPath.row]
            }
            //viewController.labelString = clickRow
            //viewController.delegate = self
        }
        
        if "linkAdd2" == segue.identifier {
                var viewController = segue.destinationViewController as Add2VC
                // nothing has to send to popup view
                viewController.delegate1 = self
            
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func hitAdd(sender: AnyObject) {
        loadDataJsonOnline()
        tableView.reloadData()
    }
}
