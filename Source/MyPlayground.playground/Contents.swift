import UIKit

var str = "안녕 반가워!"

var myAge : Int = 20
var num : Double = 1234.123

let pi : Double = 3.141592
let canTouchThis : Bool = false

var yourAge = 23

myAge == yourAge

print(myAge)
print("hi"+"bye")

var apples = 5
print("Sally has \(apples) apples")

print("Sally has \(apples-5) apples")

// while
var secondsLeft = 3
while (secondsLeft > 0){
    print(secondsLeft)
    secondsLeft = secondsLeft - 1
}
print("Blast off!")

//break statement
var cokesLeft = 7
var fantasLeft = 4
while(cokesLeft > 0){
    print("You have \(cokesLeft) Cokes Left")
    cokesLeft = cokesLeft - 1
    if(cokesLeft <= fantasLeft){
        break;
    }
}
print("You Stop drinking Cokes")

//continue Statement
var numbers = 0
while(numbers <= 10){
    if(numbers == 9){
        numbers = numbers + 1
        continue
    }
    print(numbers)
    numbers = numbers + 1
}


//Optional
// optional 변수가 nil이 아니면 할당 해라
var optionalNumber : Int? = 5
optionalNumber = nil
if let myNumber = optionalNumber {
    print("It is a number")
}
else {
    print("It is not a number")
}

var languagesLearned : String = "hihi"
var languagesLearnedNum : Int? = Int(languagesLearned)
if let myNum = languagesLearnedNum {
    print("It is a number")
}
else{
    print("It is not a number")
}

// practice
var tutorialTeam: String = "55"
var editorialTeam = 23

var tutorialTeamNum: Int? = Int(tutorialTeam)

if let numTutorial = tutorialTeamNum{
    if(numTutorial > editorialTeam){
        print("\(numTutorial) is greater than \(editorialTeam)")
    }
    else if(numTutorial < editorialTeam){
        print("\(numTutorial) is less than \(editorialTeam)")
    }
    else{
        print("\(numTutorial) is equal to \(editorialTeam)")
    }
}
else{
    print("Invalid Entry")
}
