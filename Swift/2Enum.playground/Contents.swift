import UIKit

enum School4: String {
    case elementary = "ele"
    case middle = "mid"
    case high = "hig"
}

let school: School4 = .high
print(school.rawValue)

let school2: School4? = School4(rawValue: "ele")
print(school2!.rawValue)

struct Student {
    let name: String
    let school: School4
    
    func updateStudent() {
        self.school.rawValue
    }
}

// 열거형의 연관값
enum MainDish {
    case pasta(taste: String)
    case pizza(topping: String)
}

var pasta = MainDish.pasta(taste: "spicy")
print("pasta: \(pasta)")
