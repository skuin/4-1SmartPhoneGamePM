import UIKit

class Person{
    var firstName = ""
    var lastName = ""
    var age = 0
    
    func input() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let rawString = NSString(data: inputData, encoding:String.Encoding.utf8.rawValue)
        if let string = rawString {
            return string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        } else {
            return "Invalid input"
        }
    }
    
    //1. 이름을 변경하는 메소드
    func  changeFirstName(newFirstName:String){
        firstName = newFirstName
    }
    //2. 이름을 입력받는 메소드
    func enterInfo() {
        print("What is the first name?")
        firstName = input()
    }
    //3. 이름을 print하는 메소드
    func printInfo() {
        print("First Name: \(firstName)")
    }
}

//class Person의 인스턴스 객체 newPerson 생성
var newPerson = Person()

//newPerson 객체의 property설정
newPerson.firstName = "JU"
newPerson.lastName = "J"
newPerson.age = 25

newPerson.changeFirstName(newFirstName: "Paul")
