import UIKit

func randomIntBetween(low:Int, high:Int) -> Int {
    let range = high - (low - 1)
    return (Int(arc4random()) % range) + (low - 1)
}

// 1에서 100 사이의 랜덤넘버 int상수 answer 선언
let answer = randomIntBetween(low:1, high: 100)

var guess = 7

// 랜덤넘버 answer와 guess비교
if(guess > answer){
    print("Lower")
} else if(guess < answer){
    print("Higher")
}else{
    print("Correct! The answer was \(answer).")
}


