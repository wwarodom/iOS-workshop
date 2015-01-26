//
//  Add2VC.swift
//  table
//
//  Created by CoE on 1/25/2558 BE.
//  Copyright (c) 2558 CoE. All rights reserved.
//

import UIKit

protocol Add2VCDelegate {
    func selectText(str: String	)
    
}

class Add2VC: UIViewController {
    
    var delegate1: Add2VCDelegate?
    var txtItem: String?
    
    
    @IBOutlet weak var txtInputItem: UITextField!
    
    @IBAction func clickOK(sender: AnyObject) {
        txtItem = txtInputItem.text
        delegate1?.selectText(txtItem!)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
