//
//  ViewController.swift
//  HelloiPhone
//
//  Created by eunjikim on 2017. 9. 26..
//  Copyright © 2017년 eunjikim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func change(_ sender: Any) {
        myLabel.text = "Hello iPhone"
    }
    
}

