//
//  DevicesViewController.swift
//  Audile
//
//  Created by GLOW on 8/15/16.
//  Copyright © 2016 ku. All rights reserved.
//

import UIKit
import BetterSegmentedControl

class DevicesViewController: UIViewController {
    //media player
    
    @IBOutlet weak var songProgress: UIProgressView!
    @IBOutlet weak var sourceView: UIImageView!
    @IBOutlet weak var control: BetterSegmentedControl!
    
    @IBOutlet weak var tapLabel: UILabel!
    //pulse
     let pulsator = Pulsator()
    
    //
    @IBOutlet weak var deviceView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        sourceView.layer.layoutIfNeeded()
        pulsator.position = sourceView.layer.position
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func initView(){
        control.titles = ["✚ Add Devices", "✔︎ Added devices"]
        control.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)!
        control.selectedTitleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)!
        control.alwaysAnnouncesValue = true
        songProgress.transform = CGAffineTransformScale(songProgress.transform, 1, 10)
        
        //palse
        sourceView.layer.superlayer?.insertSublayer(pulsator, below: sourceView.layer)
        pulsator.numPulse = 7
        pulsator.radius = (UIScreen.mainScreen().bounds.width - 10) / 2
        pulsator.animationDuration = 5
        pulsator.backgroundColor = control.backgroundColor?.CGColor

    }
    @IBAction func connectDeviceAction(sender: AnyObject) {
        let btn = sender as! UIButton
        UIView.animateWithDuration(1, delay: 0.0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            
            btn.frame = CGRectMake(btn.layer.position.x, btn.layer.position.y, btn.frame.size.width/2, btn.frame.size.height/2)
            
            }, completion: { (finished: Bool) -> Void in
                
                 btn.hidden = true
        })
       
        sourceView.hidden = false
        tapLabel.text = "Finding Devices"
        pulsator.start()
    }
    @IBAction func backAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func switchAction(sender: BetterSegmentedControl) {
        if sender.index == 0 {
            deviceView.hidden = true
        }
        else {
            deviceView.hidden = false
        }
    }
}