//
//  DevicesViewController.swift
//  Audile
//
//  Created by GLOW on 8/15/16.
//  Copyright © 2016 ku. All rights reserved.
//

import UIKit

class DevicesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func backAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}