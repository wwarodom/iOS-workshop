//
//  Add2VC.swift
//  table
//
//  Created by CoE on 1/25/2558 BE.
//  Copyright (c) 2558 CoE. All rights reserved.
//

import UIKit

protocol Add2VCDelegate {
    func selectText(str: String, str2: String)
 
    
}

class Add2VC: UIViewController {
    
    var delegate1: Add2VCDelegate?
    var txtItem: String?
    var txtStr2: String?
    
    @IBOutlet weak var myTextView: UITextView!
    
    @IBOutlet weak var txtInputItem: UITextField!
    
    @IBAction func clickOK(sender: AnyObject) {
        txtItem = txtInputItem.text
        txtStr2 = myTextView.text
        
        delegate1?.selectText(txtItem!, str2: txtStr2!)
        dismissViewControllerAnimated(true, completion: nil)
        
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
