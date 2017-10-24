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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
    }

    func configureWithUser(_ user: User) {
        if let thumbnail = user.thumbnailPicture {
            self.imageView.loadImageUsingCache(withUrl: thumbnail)
            self.imageView.layer.masksToBounds = true
            self.imageView.layer.cornerRadius = 27
        }
        var name:String = ""
        if let firstName = user.firstName {
            name += firstName
            name += " "
        }
        if let lastName = user.lastName {
            name += lastName
        }
        self.titleLabel.text = name

        var detail:String = ""
        if let dob = user.dob,
            let nat = user.nationality {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Constants.dateFormat
            let date = dateFormatter.date(from: dob)!
            let requestedComponent: Set<Calendar.Component> = [.month]
            let yrs = Calendar.current.dateComponents(requestedComponent, from: date, to: Date()).month!/12
            detail += "\(yrs)"
            detail += " years from "
            detail += nat
        }
        self.subtitleLabel.text = detail
    }
}
