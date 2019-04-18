//
//  ViewController.swift
//  Exchange Rate
//
//  Created by kpugame on 2019. 3. 30..
//  Copyright © 2019년 JEONGUN JO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }
    
    @IBOutlet var usdTotalTextField : UITextField!
    @IBOutlet var jpyTotalTextField : UITextField!
    @IBOutlet var cnyTotalTextField : UITextField!
    @IBOutlet var usdSlider : UISlider!
    @IBOutlet var jpySlider : UISlider!
    @IBOutlet var cnySlider : UISlider!
    @IBOutlet var usdRateLabel : UILabel!
    @IBOutlet var jpyRateLabel : UILabel!
    @IBOutlet var cnyRateLabel : UILabel!
    @IBOutlet var resultTextView : UITextView!
    
    @IBAction func calculateTapped(sender : AnyObject){
        usdExchRate.total = Double((usdTotalTextField.text! as NSString).doubleValue)
        
        let possibleTips = usdExchRate.returnPossibleTips()
        let jpyPossibleTips = jpyExchRate.returnPossibleTips()
        let cnyPossibleTips = cnyExchRate.returnPossibleTips()
        var results = ""
        
       //var intExRateValue = Int(exRateValue)
        
        for(rate, exRateValue) in possibleTips{
            results += "\(rate)% 쿠폰: \(exRateValue)달러 환전 가능\n"
        }
        
        results += "\n"
        
        for(rate, exRateValue) in jpyPossibleTips{
            results += "\(rate)% 쿠폰: \(exRateValue)엔 환전 가능\n"
        }
        
        results += "\n"
        
        for(rate, exRateValue) in cnyPossibleTips{
            results += "\(rate)% 쿠폰: \(exRateValue)위안 환전 가능\n"
        }
        
        resultTextView.text = results
    }
    
    @IBAction func exchangeRate(sender : AnyObject){
        usdExchRate.rate = Double(usdSlider.value)
        jpyExchRate.rate = Double(jpySlider.value)
        cnyExchRate.rate = Double(cnySlider.value)
        refreshUI()
    }
    
    @IBAction func viewTapped(sender : AnyObject){
        usdTotalTextField.resignFirstResponder()
    }

    let usdExchRate = ExchangeRateModel(total: 1000000, rate: 1000)
    let jpyExchRate = ExchangeRateModel(total: 500000, rate: 1000)
    let cnyExchRate = ExchangeRateModel(total: 300000, rate: 161)
    
    func refreshUI(){
        usdTotalTextField.text = String(format: "%0.2f", usdExchRate.total)
        jpyTotalTextField.text = String(format: "%0.2f", jpyExchRate.total)
        cnyTotalTextField.text = String(format: "%0.2f", cnyExchRate.total)
        usdSlider.value = Float(usdExchRate.rate)
        jpySlider.value = Float(jpyExchRate.rate)
        cnySlider.value = Float(cnyExchRate.rate)
        usdRateLabel.text = "원/달러: " + String(format: "%0.2f", usdSlider.value)
        jpyRateLabel.text = "원/엔: " + String(format: "%0.2f", jpySlider.value)
        cnyRateLabel.text = "원/위안: " + String(format: "%0.2f", cnySlider.value)
        resultTextView.text = ""
    }
    
}
