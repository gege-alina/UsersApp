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
    var postcode: NSNumber?

    var email: String?
    var username: String?
    var password: String?
    var salt: String?
    var md5: String?
    var sha1: String?
    var sha256: String?

    //id
    var idName: String?
    var idValue: String?

    var dob: String?
    var registered: String?
    var phone: String?
    var cell: String?
    var largePicture: String?
    var mediumPicture: String?
    var thumbnailPicture: String?
    var nationality: String?

    init(withDict dict: Dictionary<String, Any>) {
        if let val = dict[Constants.nameKey] as? Dictionary<String, Any> {
            if let title = val[Constants.titleKey] as? String {
                self.titleName = title
            }
            if let firstName = val[Constants.firstKey] as? String {
                self.firstName = firstName
            }
            if let lastName = val[Constants.lastKey] as? String {
                self.lastName = lastName
            }
        }
        if let dateOfBirth = dict[Constants.dateOfBirthKey] as? String {
            self.dob = dateOfBirth
        }
        if let login = dict[Constants.loginKey] as? Dictionary<String, Any> {
            if let username = login[Constants.usernameKey] as? String {
                self.username = username
            }
        }
        if let id = dict[Constants.idKey] as? Dictionary<String, Any> {
            if let name = id[Constants.nameKey] as? String {
                self.idName = name
            }
            if let value = id[Constants.valueKey] as? String {
                self.idValue = value
            }
        }
        if let nationality = dict[Constants.nationalityKey] as? String {
            self.nationality = nationality
        }
        if let email = dict[Constants.emailKey] as? String {
            self.email = email
        }
        if let phone = dict[Constants.phoneKey] as? String {
            self.phone = phone
        }
        if let location = dict[Constants.locationKey] as? Dictionary<String, Any> {
            if let street = location[Constants.streetKey] as? String {
                self.street = street
            }
            if let city = location[Constants.cityKey] as? String {
                self.city = city
            }
            if let state = location[Constants.stateKey] as? String {
                self.state = state
            }
            if let postcode = location[Constants.postcodeKey] as? NSNumber {
                self.postcode = postcode
            }
        }
        if let picture = dict[Constants.pictureKey] as? Dictionary<String, Any> {
            if let thumbnail = picture[Constants.thumbnailKey] as? String {
                self.thumbnailPicture = thumbnail
            }
        }

    }
}
