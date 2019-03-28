//
//  ViewController.swift
//  My Stop Watch
//
//  Created by kpugame on 2019. 3. 20..
//  Copyright © 2019년 JEONGUN JO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // unwrapped optional 라벨 프라퍼티 선언
    @IBOutlet var timerLabel: UILabel!
    
    // 타이머를 사용하기 위한 변수 2개 선언
    var firstMinute = 0
    var secondMinute = 0
    var firstSeconds = 0
    var secSeconds = 0
    var milliSec = 0
    var timer = Timer()
    
    var condition = -1
    
    @IBAction func StartButtonPress()
    {
        NSLog("Start Button Press")
    
        if !timer.isValid{
            timerLabel.text = "\(secondMinute)\(firstMinute):\(secSeconds)\(firstSeconds):\(milliSec)"
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(self.subtractTime), userInfo: nil, repeats: true )
        }
    }
    
    @IBAction func StopButtonPress()
    {
        NSLog("Stop Button Press")
        
        if timer.isValid{
            timer.invalidate()
        }
        
    }
    
    @IBAction func ResetButtonPress()
    {
        NSLog("Reset Button Press")
        
        if !timer.isValid{
            timer.invalidate()
            
            firstMinute = 0
            secondMinute = 0
            firstSeconds = 0
            secSeconds = 0
            milliSec = 0
            
            timerLabel.text = "\(secondMinute)\(firstMinute):\(secSeconds)\(firstSeconds):\(milliSec)"
        }
    }
    
    
    @objc func subtractTime(){
        timerLabel.text = "\(secondMinute)\(firstMinute):\(secSeconds)\(firstSeconds):\(milliSec)"
        if (milliSec<9){
            milliSec = milliSec + 1
        }
        else{
            milliSec = 0
            if (firstSeconds<9){
               firstSeconds += 1
            }
            else{
                firstSeconds = 0
                if(secSeconds < 5){
                    secSeconds += 1
                }
                else{
                    secSeconds = 0
                    if(firstMinute < 9){
                        firstMinute += 1
                    }
                    else{
                        firstMinute = 0
                        if(secondMinute<9){
                            secondMinute += 1
                        }
                    }
                }
            }
            
        }
        
    
    }
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }

    
}

