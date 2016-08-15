//
//  SongCollectionViewCell.swift
//  Audile
//
//  Created by GLOW on 8/13/16.
//  Copyright © 2016 ku. All rights reserved.
//

import UIKit

private let avatarListLayoutSize: CGFloat = 80.0

class SongCollectionViewCell: UICollectionViewCell, CellInterface {
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var backgroundGradientView: UIView!
    @IBOutlet private weak var songTitle: UILabel!
    @IBOutlet private weak var singerName: UILabel!
    @IBOutlet weak var statisticLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    func bind(song: Song) {
        avatarImageView.image = song.avatar
//        avatarImageView.layer.cornerRadius = 8
//        containerView.layer.cornerRadius = 8
        songTitle.text = song.title

        singerName.text = song.name
    }

}
