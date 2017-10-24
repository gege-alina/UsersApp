//
//  User.swift
//  TestUsers
//
//  Created by Georgiana Stefan on 24/10/2017.
//  Copyright © 2017 georgiana. All rights reserved.
//

import UIKit

class User: NSObject {

    var gender: String?
    //name
    var titleName: String?
    var firstName: String?
    var lastName: String?
    //location
    var street: String?
    var city: String?
    var state: String?
    var postcode: Int?

    var email: String?
    var username: String?
    var password: String?
    var salt: String?
    var md5: String?
    var sha1: String?
    var sha256: String?

    var dob: String?
    var registered: String?
    var phone: String?
    var cell: String?
    var largePicture: String?
    var mediumPicture: String?
    var thumbnailPicture: String?
    var nationality: String?

    init(withDict dict: Dictionary<String, Any>) {
        if let results:[Any] = dict[Constants.resultsKey] as? [Any] {
            //val : array
            for val in results {
//                if let gender = val[Constants.genderKey] {
//                    self.gender = gender
//                }
            }
        }
    }

}
