//
//  UserPageViewController.swift
//  TestUsers
//
//  Created by Georgiana Stefan on 24/10/2017.
//  Copyright © 2017 georgiana. All rights reserved.
//

import UIKit

class UserPageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        let favourite = UIButton(type: .system)
        favourite.setImage(UIImage(named: "star"), for: .normal)
        favourite.sizeToFit()

        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "star"), for: .normal)
        button.sizeToFit()

        //button.addTarget(self, action: #selector(self.someAction), forControlEvents: .TouchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: favourite), UIBarButtonItem(customView: button)]

        configureWithUserInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configureWithUserInfo() {
        if let user = self.user,
            let thumbnail = user.thumbnailPicture {
            self.imageView.loadImageUsingCache(withUrl: thumbnail)
            self.imageView.layer.masksToBounds = true
            self.imageView.layer.cornerRadius = 27
        }
        var name:String = ""
        if let user = self.user,
            let firstName = user.firstName {
            name += firstName
            name += " "
        }
        if let user = self.user,
            let lastName = user.lastName {
            name += lastName
        }
        self.titleLabel.text = name

        var detail:String = ""
        if let user = self.user,
            let dob = user.dob,
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

        if let user = self.user,
            let username = user.username {
            self.usernameLabel.text = username
        } else {
            self.usernameLabel.text = "-"
        }
        if let user = self.user,
            let email = user.email {
            self.emailLabel.text = email
        } else {
            self.emailLabel.text = "-"
        }
        if let user = self.user,
            let phone = user.phone {
            self.phoneLabel.text = phone
        } else {
            self.phoneLabel.text = "-"
        }
        if let user = self.user,
            let address = user.street {
            self.addressLabel.text = address
        } else {
            self.addressLabel.text = "-"
        }
        if let user = self.user,
            let idName = user.idName,
            let idValue = user.idValue {
            self.idLabel.text = "ID: " + idName + " " + idValue
        } else {
            self.idLabel.text = "-"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
