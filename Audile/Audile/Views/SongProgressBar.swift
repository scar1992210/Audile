//
//  SongProgressBar.swift
//  Audile
//
//  Created by GLOW on 8/15/16.
//  Copyright © 2016 ku. All rights reserved.
//

import UIKit

class SongProgressBar: UIProgressView {

}
extension SongProgressBar {
    
    @IBInspectable var barHeight : CGFloat {
        get {
            return transform.d * 2.0
        }
        set {
            // 2.0 Refers to the default height of 2
            let heightScale = newValue / 2.0
            let c = center
            transform = CGAffineTransformMakeScale(1.0, heightScale)
            center = c
        }
    }
}
