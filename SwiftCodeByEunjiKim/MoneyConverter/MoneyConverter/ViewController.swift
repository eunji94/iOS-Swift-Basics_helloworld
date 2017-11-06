//
//  ViewController.swift
//  MoneyConverter
//
//  Created by eunjikim on 2017. 10. 21..
//  Copyright © 2017년 eunjikim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencySegment: UISegmentedControl!
    
    @IBOutlet weak var sourceMoneyField: UITextField!
    
    @IBOutlet weak var targetMoneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func convertMoney(_ sender: Any) {
        guard let sourceCurrency = Currency(rawValue: currencySegment.selectedSegmentIndex) else {
            print("Source Currency Error")
            return
        }
        
        guard let sourceAmount = Double(sourceMoneyField.text!) else {
            targetMoneyLabel.text = "Error"
            return
        }
        let sourceMoney = Money(sourceAmount, currency: sourceCurrency)
        
        var targetMoneyString = ""
        for i in 0..<4 {
            targetMoneyString += sourceMoney.valueInCurrency(currency: Currency.init(rawValue: i)!)
            targetMoneyString += "\r\n"
        }
        targetMoneyLabel.text = targetMoneyString
    }
}

