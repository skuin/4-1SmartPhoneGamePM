import UIKit

var str = "Hello, playground"

let swiftTeam = 13
let IOSTeam : Int = 54

class TipCalculator{
    let total : Double
    let taxPct : Double
    let subtotal : Double
    
    // class property는 선언할 때 혹은 initializer 에서 초기값을지정해야함
    // 초기값을 가지지 않기 위해서는 optional로(?를사용한다) 선언해야함
    init(total: Double, taxPct: Double){
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    
    // tip 계산 함수 : tip은 pre-tax subtotal에서 계산해야 함
    func calcTipWithTipPct(tipPct: Double)->Double {
        return subtotal * tipPct
    }
    
    /*
    func printPossibleTips(){
        // Inferred와 Explicit array 변수 선언
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTupsExplicit : [Double] = [0.15, 0.18, 0.20]
        
        for possibleTip in possibleTipsInferred{
            print("\(possibleTip*100)% : \(calcTipWithTipPct(tipPct: possibleTip))")
        }
    }
    */
    
    //Dictionary (Key/value 쌍을 갖는 자료구조)를 반환하는 함수
    func returnPossibleTips() -> [Int: Double] {
        //Inferred array 팁 퍼센트 배열 선언
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        //빈 Dictionary 변수 선언
        var retval = [Int: Double]()
        
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

let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
//tipCalc.printPossibleTips()
tipCalc.returnPossibleTips()
