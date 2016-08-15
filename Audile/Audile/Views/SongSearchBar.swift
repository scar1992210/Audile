//
//  SongSearchBar.swift
//  Audile
//
//  Created by GLOW on 8/16/16.
//  Copyright © 2016 ku. All rights reserved.
//

import UIKit

class SongSearchBar: UISearchBar {

}
extension SongSearchBar {
    func changeSearchBarColor(color : UIColor) {
        for subView in self.subviews {
            for subSubView in subView.subviews {
                if subSubView.conformsToProtocol(UITextInputTraits.self) {
                    let textField = subSubView as! UITextField
                    textField.backgroundColor = color
                    break
                }
            }
        }
    }
}
