//
//  ViewController.swift
//  ServerCommunicationDemo
//
//  Created by Chhaileng Peng on 2/2/19.
//  Copyright © 2019 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URL
        // URLRequest
        // URLSession
        
        let url = URL(string: "http://api-ams.me/v1/api/articles")
        
        var request = URLRequest(url: url!)
        request.addValue("Basic YXBpOmFwaQ==", forHTTPHeaderField: "Authorization")
        
//        let session = URLSession(configuration: URLSessionConfiguration.default)

        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                let dict = jsonObject as! [String: Any]
                print(dict)
//                let articles = dict["DATA"] as! NSArray
//                for article in articles {
//                    let a = article as! [String: Any]
//                    print(a["TITLE"] as! String)
//                }
            }
        }
        
        task.resume()
        
        
    }


}

