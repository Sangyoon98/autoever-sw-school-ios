import UIKit

// MARK: - 옵셔널(Optional): nil을 포함할 수 있는 변수나 상수
// 스위프트에서 nil은다른 언어에서의 null과 같은 개념

// nil: 아무것도 없는 것
var a1: Bool = true     // Bool 타입은 true, false
var a2: Bool? = true    // true, false, nil

var a3: Int = 0         // 0, -100, -1000, 20000121212, ...
var a4: Int? = 0        // 0, -100, -1000, 20000121212, ..., nil

var a5: String = ""
var a6: String = "asdfasd" // 모든 문자열이 저장될 수 있다.
var a7: String? = "asdfasd" // 모든 문자열이 저장될 수 있다. + nil

var a8: MyClass?

class MyClass {
    
}

// 옵셔널 타입
// - 옵셔널 Int
// - 옵셔널 String
// - 옵셔널 Bool
// - 옵셔널 Double
// - 옵셔널 ...

var a9: Optional<Int> = 9
print(a9)

var a10: Optional<String> = "안녕하세요."
print(a10)

var a11 = String(10)
print(a11)


// 왜 nil과 옵셔널의 개념이 존재하는가?

// - 형변환 안되는 값일 때
var a12: String = "안녕하세요."
var a13 = Int(a12)

// - 딕셔너리에서 요소의 값 가져오는 데 해당 키가 없을 때 대비해서
var dict: [String: Int] = ["a": 1, "b": 2]
var a14 = dict["c"]

// - 어떤 함수가 반환값이 있는데 함수 내부의 수행문이 원하는 결과를 도출하지 못 할 때
func divide(num1: Int, num2: Int) -> Int? {
    if num2 == 0 {
        return nil
    }
    return num1 / num2  // 만약 num2가 0이면 에러가 나게 된다.
}

var a15: Int? = divide(num1: 10, num2: 5)
var a16 = divide(num1: 10, num2: 0)


// String
// nil과 빈문자열은 다르다
var a17: String? = ""
var a18: String? = nil


/// 강제 추출 Force Unwrapping
/// - 옵셔널 타입의 변수나 상수를 사용할 때 강제로 nil이 아니다라고 가정하고 강제로 해당 타입(Int, String 등)의 데이터를 꺼내온다.
/// - 강제로 데이터 타입의 값을 꺼내오기 때문에 nil이 있을 경우 런타임 에러가 발생하면 위험하므로 권장하지 않는 방법이다.
/// - 우리가 명백히 nil이 아니라고 보장하고 문법 연습, 작은 프로젝트에서만 사용하는 것을 권장한다.
var c1: Int? = 10
var c2: Int? = nil
print(c1!)
//print(c2!)

/// 옵셔널 바인딩 Optional Binding
/// - if 구문을 통해 nil이 아닐 때만 안전하게 값을 꺼내 사용한다.
/// - if 문 안에서만 사용할 수 있다.
var d1: Int? = 10
if d1 != nil {
    print(d1!)
}

// 코틀린에서의 사용법: 자동으로 null 검사를 완료한 블럭 내부에서는 스마트 캐스팅이 되어 원래 데이터 타입의 변수(상수) 그대로 사용할 수 있다.
//if d1 != null {
//    print(d1)
//}

print("---------------------")

/// i f-let(var) 방식: 옵셔널 바인딩의 한 방식
var d2: Int? = 10
var d3: String? = "ㅇㅇ"
if let d2unwrapped = d2, let d3unwrapped = d3 { // let으로 하면 안에서 값 수정하지 못 한다
//    d2unwrapped = 20  // var로 하면 값을 수정할 순 있지만 원래 데이터 타입의 값을 언래핑 해서 사용하는게 목적이기 때문에 잘 하지는 않는다.
    print(d2unwrapped)
    print(d3unwrapped)
} else {
    print("d2 또는 d3가 nil입니다.")
}

print("---------------------")

/// guard-let(var): 이것도 옵셔널 바인딩의 한 방식 + 조기종료(조기탈출)
/// - 함수 내부에서 보통 사용한다.
var d4: Int? = 10
var d5: Int? = 12
func testFunc(value: Int?, value2: Int?) {
    guard let d4unwraped = value, let d5unwraped = value2 else { // guard-let, guard-var 모두 가능하다.
        print("value가 nil입니다.")
        return
    }
//    d4unwraped = 20
    print(d4unwraped)
}
testFunc(value: d4, value2: d5)

print("---------------------")

/// 암시적 추출 옵셔널 implicitily Unwrapped Optional
var e1: Int? = 10
var e2: Int? = nil
print(e1!)
print(e2!)

/*var e3: Int! = 10
var e4: Int! = nil
print(e3!)
//print(e4!)

if let e3Int = e3, let e4Int = e4 {
    print(e3Int)
    print(e4Int)
}*/

print("---------------------")

var e10: String = "안녕하세요. "

var e3: String? = "조기환입니다."
var e4: String! = "조기환입니다."
//print(e3.count) // 일반 옵셔널 타입은 컴파일 에러남
print(e3!.count)    // 일반 옵셔널 타입은 추출 해줘야 함
print(e4.count) // 암시적 추출 옵셔널 타입은 이미 강제 추출되어 있기 때문에 따로 느낌표 안 써줘도 된다.

e10.append(e3!)
e10.append(e4)

print(e10)

// 여전히 타입은 옵셔널
print(e3)
print(e4)


// MARK: - 1. 옵셔널(Optional)
// 값이 있을 수도 있고 없을 수도 있는 타입입니다.
// 값이 있을 때: Optional(값) 형태로 저장됨
// 값이 없을 때: nil
// enum 구조로 되어있음 → some(값), none

var username: String?   // 옵셔널
username = "조기범"
print("옵셔널 예시: \(username)") // 출력: Optional("조기범")
// 실사용: 서버에서 사용자 데이터를 가져올 때, 데이터가 없을 수 있으므로 옵셔널 사용


// MARK: - 2. nil
// 옵셔널 타입에서 "값이 없다"는 상태를 나타냅니다.
// 변수를 선언할 때 초기값을 안 주면 자동으로 nil 저장
// nil 비교로 값이 있는지 확인 가능

var score: Int? = nil  // 초기값 없음
if score == nil {
    print("nil 예시: 점수가 없습니다.")
}

score = 95
print("nil 예시: 값 할당 후: \(score)") // 출력: Optional(95)


// MARK: - 3. 강제 추출 (Forced Unwrapping)
// 옵셔널 값 뒤에 ! 붙여서 강제로 값을 가져옴
// 값이 없으면 런타임 에러 발생 → 조심해서 사용

var message: String? = "Hello, Swift"
print("강제 추출 예시: \(message!)") // 출력: Hello, Swift

message = nil
// print(message!)  // 실행 시 크래시: Unexpectedly found nil
// 주로 반드시 값이 있다고 보장되는 경우에만 사용


// MARK: - 4. 옵셔널 바인딩 (Optional Binding)
// 값이 있을 때만 안전하게 언래핑하는 방법
// if let / guard let 사용
// 특징: 값이 nil이 아니면 실행, nil이면 else 블록 실행
// 장점: 강제 언래핑보다 안전하고 가독성이 높음

var optionalName: String? = "Student"

// if let 예시
if let name = optionalName {
    print("옵셔널 바인딩 예시(if let): 환영합니다, \(name)!") // 출력: 환영합니다, Student!
} else {
    print("옵셔널 바인딩 예시(if let): 이름이 없습니다.")
}

// guard let 예시
func greetUser(_ user: String?) {
    guard let name = user else {
        print("옵셔널 바인딩 예시(guard let): 이름이 없습니다.")
        return
    }
    print("옵셔널 바인딩 예시(guard let): 환영합니다, \(name)")
}

greetUser(optionalName)  // 출력: 환영합니다, Student!
greetUser(nil)           // 출력: 이름이 없습니다.


// MARK: - 5. 암시적 추출 옵셔널 (Implicitly Unwrapped Optional)
// 옵셔널이지만 값을 자동으로 언래핑해주는 타입
// 선언 시 String! 같이 느낌표 사용
// 값이 무조건 있다고 보장될 때 사용 (예: IBOutlet)
// 주의: nil일 경우 강제 언래핑처럼 크래시 발생

var implicitName: String! = "Teacher"
print("암시적 추출 옵셔널 예시: \(implicitName)") // 출력: Teacher

implicitName = nil
// print(implicitName)  // 실행 시 크래시: Unexpectedly found nil

var labelText: String! = "UILabel text"
if let text = labelText {
    print("암시적 추출 옵셔널 바인딩 예시: \(text)") // 출력: UILabel text
}
