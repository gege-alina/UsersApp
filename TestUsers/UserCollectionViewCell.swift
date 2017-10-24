//
//  UserCollectionViewCell.swift
//  TestUsers
//
//  Created by Georgiana Stefan on 24/10/2017.
//  Copyright © 2017 georgiana. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    var user: User?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10

        if let name = self.user?.firstName {
            self.titleLabel.text = name
        }
//        if let name = self.user?.firstName {
//            self.titleLabel.text = name
//        }
        self.subtitleLabel.text = "world"
    }

}
