import UIKit

// MARK: - Property(프로퍼티)
/// - 저장 프로퍼티
/// - 연산 프로퍼티
/// - 프로퍼티 감시자

struct Student {
    // 저장 프로퍼티
    var name: String = ""
    var `class`: String = "스위프트"
    var koreanAge: Int = 0
    
    // 연산 프로퍼티
    var westernAge: Int {
        get {
            return koreanAge - 1
        }
        set(inputValue) {
            koreanAge = inputValue + 1
        }
    }
    
    // 읽기 전용 연산 프로퍼티
    var selfIntroduction: String {
        get {
            return "안녕하세요, 저는 \(name)입니다. \(self.class)에서 공부하고 있습니다. 한국 나이 \(koreanAge)살, 외국 나이 \(westernAge)입니다."
        }
    }
}

// 인스턴스 생성
var keon = Student()
keon.name = "조기환"
keon.westernAge = 25
print(keon.selfIntroduction)

print("------------------------------")

// 프로퍼티 감시자
struct Money {
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다.")
        }
        didSet(oldRate) {
            print("환율이 \(currencyRate)에서 \(oldRate)으로 변경될 예정입니다.")
        }
    }
}
var money = Money()
money.currencyRate = 1200


// MARK: - 개념 정리
// 구조체: 값 타입 (값 복사) → 학생 정보
// 값 타입은 인스턴스를 복사할 때 원본 인스턴스와 독립적입니다.
// 즉, 한 인스턴스의 변경이 다른 인스턴스에 영향을 주지 않습니다.
// 주로 데이터 모델링, 간단한 데이터 저장 구조체에 적합합니다.

struct Student {
    var name: String    // 저장 프로퍼티: 이름
    var score: Int      // 저장 프로퍼티: 점수
}


// 클래스: 참조 타입 (참조 복사) → 교실 정보
// 참조 타입은 인스턴스를 복사할 때 원본과 동일한 인스턴스를 참조합니다.
// 따라서 하나의 인스턴스를 여러 변수가 공유하고, 변경이 모두 반영됩니다.
// 주로 공통 상태를 공유하거나 메서드를 정의해야 할 때 유용합니다.
// Swift에서 클래스는 상속, 참조 카운팅(ARC), Objective-C 호환 등을 지원합니다.

class Classroom {
    var roomNumber: String = "Unknown"   // 저장 프로퍼티: 교실 번호 (초기 값 제공)
    var isClassInSession: Bool = false   // 저장 프로퍼티: 수업 진행 여부 (초기 값 제공)
}


// 값 타입 예시: 값 복사 (Student)
// 학생 인스턴스를 생성하고 복사 시, 독립적인 특성을 확인합니다.

var student1 = Student(name: "John", score: 85) // student1 생성
var student2 = student1                         // student1을 student2에 값 복사

// student1과 student2는 독립적인 인스턴스
student1.score = 95

print("Student1: \(student1.name), Score: \(student1.score)") // 출력: John, Score: 95
print("Student2: \(student2.name), Score: \(student2.score)") // 출력: John, Score: 85
// 결론: 구조체는 값 타입이므로 복사 시 독립적인 객체가 생성됨.


// 참조 타입 예시: 참조 복사 (Classroom)
// 교실 인스턴스를 생성하고 복사 시, 참조 공유 특성을 확인합니다.

let classroom1 = Classroom()   // classroom1 인스턴스 생성
let classroom2 = classroom1    // classroom1을 classroom2에 참조 복사

// classroom1과 classroom2는 동일한 인스턴스를 가리킴
classroom1.isClassInSession = true
classroom1.roomNumber = "Room A-101"

print("Classroom1: \(classroom1.roomNumber), In Session: \(classroom1.isClassInSession)")
// 출력: Room A-101, true

print("Classroom2: \(classroom2.roomNumber), In Session: \(classroom2.isClassInSession)")
// 출력: Room A-101, true
// 결론: 클래스는 참조 타입이므로 복사 시 동일한 인스턴스를 공유함.


// 프로퍼티 예제 (BankAccount)
struct BankAccount {
    var accountNumber: String = "Unknown"   // 저장 프로퍼티: 계좌번호 (초기 값 제공)
    var balance: Double = 0.0              // 저장 프로퍼티: 잔액 (초기 값 제공)
    
    // 프로퍼티 감시자: balance 변경 시 호출
    var balanceWithObserver: Double {
        willSet {
            print("잔액이 \(balance)에서 \(newValue)로 변경될 예정입니다.")
        }
        didSet {
            print("잔액이 \(oldValue)에서 \(balanceWithObserver)로 변경되었습니다.")
        }
    }
    
    // 연산 프로퍼티: 잔액에 이자를 적용한 금액 반환
    var balanceWithInterest: Double {
        get {
            return balance * 1.05 // 5% 이자 가정
        }
        set {
            balance = newValue / 1.05 // 역산하여 balance 업데이트
        }
    }
}


// 인스턴스 생성 및 호출
// 구조체는 값 타입이므로 프로퍼티 변경을 위해 var로 선언해야 함
var account = BankAccount(accountNumber: "12345-67890", balance: 1000.0, balanceWithObserver: 1000.0)

print("이자 포함 잔액: \(account.balanceWithInterest)")
// 출력: 이자 포함 잔액: 1050.0

account.balanceWithObserver = 2000.0
// 출력: 잔액이 1000.0에서 2000.0로 변경될 예정입니다.
// 출력: 잔액이 1000.0에서 2000.0로 변경되었습니다.

account.balanceWithInterest = 2100.0
print("새로운 잔액: \(account.balance)")
// 출력: 새로운 잔액: 2000.0

