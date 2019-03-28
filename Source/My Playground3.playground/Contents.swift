//
//  TipCalculatorModel.swift
//  TipCarculator
//
//  Created by kpugame on 2019. 3. 21..
//  Copyright © 2019년 JEONGUN JO. All rights reserved.
//

import Foundation
// 1. UITableView 클래스 사용하기 위해서
import UIKit
// 2. UITableViewDataSource를 구현하기 위해서 NSObject를 상속받아야함
class TestDataSource: NSObject{
    // 3. TipCalculatorModel 클래스 인스턴스 생성하고 가능한 팁과 토탈을 가지는 빈 딕셔너리와 정렬된 키 배열 생성
    
}


class TipCalculatorModel{
    var total : Double
    var taxPct : Double
    //subtotal을 Computed Property로 바꿈
    //Computed Property는 Stored Property와 달리 값을 저장하지 않고 필요할 때 계산함
    var subtotal : Double {
        get{
            return total / (taxPct + 1)
        }
    }
    
    // class property는 선언할 때 혹은 initializer 에서 초기값을지정해야함
    // 초기값을 가지지 않기 위해서는 optional로(?를사용한다) 선언해야함
    init(total: Double, taxPct: Double){
        self.total = total
        self.taxPct = taxPct
        //subtotal = total / (taxPct + 1)
    }
    
    // tip 계산 함수 : tip은 pre-tax subtotal에서 계산해야 함
    func calcTipWithTipPct(tipPct: Double)->(tipAmt:Double, total:Double) {
        let tipAmt = subtotal * tipPct
        let finalTotal = total + tipAmt
        return (tipAmt, finalTotal)
    }
    
    //Dictionary (Key/value 쌍을 갖는 자료구조)를 반환하는 함수
    //(tipAmt:Double, total:Double) Dictionary 반환구조로 변경
    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double)] {
        //Inferred array 팁 퍼센트 배열 선언
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        //빈 Dictionary 변수 선언
        var retval = [Int: (tipAmt:Double, total:Double)]()
        
        //for 루프에서 3개 팁 퍼센트에 대한 팁을 계산하고 Dictionary에 추가
        for possibleTip in possibleTipsInferred{
            // 배열에서 꺼낸 Dobule 타입의 possibleTip을 Int로 타입변환
            let intPct = Int(possibleTip*100)
            // 팁 계산한 value값을 Dictionary에 key는 intPct에 맞춰서 삽입
            retval[intPct] = calcTipWithTipPct(tipPct: possibleTip)
        }
        return retval
    }
    
}

