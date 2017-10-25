//
//  UserPageViewController.swift
//  TestUsers
//
//  Created by Georgiana Stefan on 24/10/2017.
//  Copyright © 2017 georgiana. All rights reserved.
//

import UIKit
import Foundation
import MessageUI

class UserPageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
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

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(emailLabelTapped))
        tapGesture.numberOfTapsRequired = 1
        self.emailLabel.isUserInteractionEnabled = true
        self.emailLabel.addGestureRecognizer(tapGesture)
        
        configureWithUserInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configureWithUserInfo() {
        if let user = self.user {
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
                detail += nat.flag()
            }
            self.subtitleLabel.text = detail

            if let username = user.username {
                self.usernameLabel.text = username
            } else {
                self.usernameLabel.text = "-"
            }
            if let email = user.email {
                self.emailLabel.text = email
            } else {
                self.emailLabel.text = "-"
            }
            if let phone = user.phone {
                self.phoneTextField.text = phone
            } else {
                self.phoneTextField.text = "-"
            }
            if let zip = user.postcode,
                let address = user.street {
                self.adressTextField.text = address + "\(zip)"
            } else {
                self.adressTextField.text = "-"
            }
            if let idName = user.idName,
                let idValue = user.idValue {
                self.idLabel.text = "ID: " + idName + " " + idValue
            } else {
                self.idLabel.text = "-"
            }
        }
    }
    
    @objc private func emailLabelTapped() {
        self.sendEmail()
    }
    
    private func callNumber(phoneNumber:String) {
        
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(phoneCallURL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(phoneCallURL as URL)
            }
        }
    }

    private func openAddress(address:String) {
        if let addressURL = URL(string: "http://maps.apple.com/?address=" + address.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(addressURL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(addressURL as URL)
            }
        }
    }

}

extension UserPageViewController: MFMailComposeViewControllerDelegate {
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            guard let user = self.user,
                let email = user.email else {
                return
            }
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email])
            mail.setSubject("Hello")
            mail.setMessageBody("<p>Hello!</p>", isHTML: true)
            self.present(mail, animated: true)
        } else {
            let sendMailErrorAlert = UIAlertController.init(title: "Error",
                                                            message: "Unable to send email. Please check your email " +
                "settings and try again.", preferredStyle: .alert)
            sendMailErrorAlert.addAction(UIAlertAction.init(title: "OK",
                                                            style: .default, handler: nil))
            self.present(sendMailErrorAlert, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension UserPageViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.phoneTextField {
            callNumber(phoneNumber: self.phoneTextField.text!)
        }

        if textField == self.adressTextField {
            openAddress(address: self.adressTextField.text!)
        }
        return false
    }
}
