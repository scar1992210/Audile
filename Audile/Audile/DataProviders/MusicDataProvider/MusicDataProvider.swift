//
//  UserDataProvider.swift
//  YALLayoutTransitioning
//
//  Created by Roman on 02.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

class MusicDataProvider {
    
    func generateFakeUsers() -> [Song] {

        let song1 = Song(name: "Jack", songTitle: "Take me to your heart", avatar: UIImage(named: "song")!)
        let song2 = Song(name: "Jack", songTitle: "Take me to your heart", avatar: UIImage(named: "song2")!)
        let song3 = Song(name: "Jack", songTitle: "Take me to your heart", avatar: UIImage(named: "song3")!)
        let song4 = Song(name: "Jack", songTitle: "Take me to your heart", avatar: UIImage(named: "song4")!)
        let song5 = Song(name: "Jack", songTitle: "Take me to your heart", avatar: UIImage(named: "song5")!)
        let song6 = Song(name: "Jack", songTitle: "Take me to your heart", avatar: UIImage(named: "song6")!)
        let fakeUsers = [song1, song2, song3, song4, song5, song6]
        
        return fakeUsers
    }
    
}