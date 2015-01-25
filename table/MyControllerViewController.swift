//
//  MyControllerViewController.swift
//  table
//
//  Created by CoE on 1/24/2558 BE.
//  Copyright (c) 2558 CoE. All rights reserved.
//

import UIKit

class MyControllerViewController: UIViewController, TableVCDelegate {

    var operatorString = "+"
    var labelString = "You touch the row"
    @IBOutlet weak var label1: UILabel!
    
   
    func update(operatorString: String) {
        //self.operatorString = operatorString
        label1.text = operatorString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label1.text = labelString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
