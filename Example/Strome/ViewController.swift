//
//  ViewController.swift
//  Strome
//
//  Created by Ravi on 04/03/2024.
//  Copyright (c) 2024 Ravi. All rights reserved.
//

import UIKit
import Strome

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Strome.shared.isWorking
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

