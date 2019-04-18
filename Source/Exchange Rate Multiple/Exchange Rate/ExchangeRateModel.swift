//
//  ExchangeRateModel.swift
//  Exchange Rate
//
//  Created by kpugame on 2019. 3. 30..
//  Copyright © 2019년 JEONGUN JO. All rights reserved.
//

import Foundation

class ExchangeRateModel{
    var total : Double
    var rate : Double
    //subtotal을 Computed Property로 바꿈
    //Computed Property는 Stored Property와 달리 값을 저장하지 않고 필요할 때 계산함
    var subtotal : Double {
        get{
            return (rate + rate * 0.02)
        }
    }
    
    // class property는 선언할 때 혹은 initializer 에서 초기값을지정해야함
    // 초기값을 가지지 않기 위해서는 optional로(?를사용한다) 선언해야함
    init(total: Double, rate: Double){
        self.total = total
        self.rate = rate
    }
    
    // tip 계산 함수 : tip은 pre-tax subtotal에서 계산해야 함
    func calcExchangeRate(rate2: Double)->Int {
        return Int(total / (rate + rate * 0.02 * rate2))
    }
    
    //Dictionary (Key/value 쌍을 갖는 자료구조)를 반환하는 함수
    func returnPossibleTips() -> [Int: Int] {
        //Inferred array 팁 퍼센트 배열 선언
        let possibleTipsInferred = [0.70, 0.50, 0.30]
        
        //빈 Dictionary 변수 선언
        var retval = [Int: Int]()
        
        //for 루프에서 3개 팁 퍼센트에 대한 팁을 계산하고 Dictionary에 추가
        for possibleTip in possibleTipsInferred{
            // 배열에서 꺼낸 Dobule 타입의 possibleTip을 Int로 타입변환
            let intPct = Int(100-possibleTip*100)
            // 팁 계산한 value값을 Dictionary에 key는 intPct에 맞춰서 삽입
            retval[intPct] = calcExchangeRate(rate2: possibleTip)
        }
        return retval
    }
    
}
