//
//  APIManager.swift
//  TestUsers
//
//  Created by Georgiana Stefan on 24/10/2017.
//  Copyright © 2017 georgiana. All rights reserved.
//

import UIKit

class APIManager: NSObject {

    func getUsers(withURL withUrl:String, completionHandler handler: @escaping (Dictionary<String, Any>) -> Void) {

        if let usableUrl = URL(string: withUrl) {
            let request = URLRequest(url: usableUrl)
            let task = URLSession.shared.dataTask(with: request,
                                                  completionHandler:
                {(data, response, error) in
                    if let data = data,
                        let stringData = String(data: data, encoding: String.Encoding.utf8),
                            let results = stringData.convertToDictionary() {
                            handler(results)
                    }
            })
            task.resume()
        }
    }
}
