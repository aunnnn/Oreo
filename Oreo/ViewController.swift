//
//  ViewController.swift
//  Oreo
//
//  Created by Wirawit Rueopas on 3/1/2561 BE.
//  Copyright © 2561 Wirawit Rueopas. All rights reserved.
//

import UIKit
import OreoAPI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let auth = BXAuthentication(apiKey: "ecf6d14b434f", apiSecret: "13583ddf775f")
        OreoAPI.bx.getBalance(auth: auth) { (res) in
            switch res {
            case .success(let balance):
                print(balance)
            case .error(let error):
                print(error)
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

