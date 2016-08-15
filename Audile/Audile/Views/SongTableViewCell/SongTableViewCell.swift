//
//  SongTableViewCell.swift
//  Audile
//
//  Created by GLOW on 8/15/16.
//  Copyright © 2016 ku. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell, CellInterface{
    @IBOutlet internal weak var avatarImageView: UIImageView!
    @IBOutlet private weak var songTitle: UILabel!
    @IBOutlet private weak var singerName: UILabel!

    func bind(song: Song) {
        avatarImageView.image = song.avatar
//                avatarImageView.layer.cornerRadius = 8
        //        containerView.layer.cornerRadius = 8
        songTitle.text = song.title
        
        singerName.text = song.name
    }

}