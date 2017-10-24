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

        // Do any additional setup after loading the view.
        self.titleLabel.text = "Hello"
        self.subtitleLabel.text = "world"

        self.usernameLabel.text = "username"
        self.emailLabel.text = "email"
        self.phoneLabel.text = "phone"
        self.addressLabel.text = "address"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
