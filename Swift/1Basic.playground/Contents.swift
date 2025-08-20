import UIKit

var greeting = "Hello, playground"
print(greeting)

var greeting2 = "Hello, Swift"
print(greeting2)

var greeting3 = "Hello, Swift3"
print(greeting3)

UIImage(systemName: "star")

var sum = 0
for i in 1...10 {
    sum += i
}

// MARK: - 주석

// 한 줄 주석

// greeting3

// command + / -> 주석

/*
 여러 줄 주석
 여러 줄 주석
 여러 줄 주석
 */

/// 문서 주석
/// - 이것은 문서 주석입니다.
/// - 클래스, 메서드 등의 도큐멘트를 작성할 때 많이 사용한다.

/**
 문서 주석 가능합니다.
 여러 줄 주석도 문서 주석 가능합니다.
 */

// 출력하기
print(greeting)
dump(greeting)

var number = 10
print(number)
dump(number)

// 수랭문 작성
// 스위프트 수핼문 작성은 코틀린과 같이 수행문 뒤에 ";"(세미콜론)을 붙이지 않아도 된다.
print("Hello, World!")
print("Hello, World!"); print("Hello, World!"); print("Hello, World!")

// println

print("Hello, World", terminator: "")
print("Hello, World", terminator: "asdf")

// MARK: - 이름 짓기 규칙

// Lower Camel Case
// 함수, 메소드, 변수, 상수 등의 이름을 지을 때
var someVar1 = 0
func someFunc1() {
    
}

// Upper Camel Case
// 타입(Int, String, Bool, Float, Double 등), 클래스
var someInt: Int = 0
class SomeClass {
    
}

// 일반 스네이크 케이스 : my_variable_name
// 어퍼 스네이크 케이스 : MY_CONSTANT_NAME

// 문자열 보간법 (String Interpolation)
let t1 = "안녕하세요." + greeting + "반갑습니다."
let t2 = "안녕하세요. \(greeting) 반갑습니다."
let t3 = "안녕하세요. \(100)"
print(t1)
print(t2)
print(t3)


// MARK: - 변수와 상수
var a = 10  // 변수 var : 변수는 다른 값으로 변경 가능
let b = 20  // 상수 let : 상수는 한 번 값을 지정하면 변경 불가능

a = 30
//b = 40

var c: Int
let d: Int

c = 50
c = 60

d = 70
//d = 80

// 여러 변수와 상수를 한 번에 선언 및 초기화 할 수 있다.
var ab1, ab2, ab3: Int
var cd1 = 100, cd2 = 200, cd3 = 300

//var z   // 타입이 정해지지 않고 초기화도 하지 않을 경우 에러 발생

// MARK: - 데이터 타입

/// Int(Integer)
// Int => 8Byte
// UInt => 8Byte
var int1 = 100
var uint1: UInt = 100
print(Int.max)
print(Int.min)

print(UInt.max)
print(UInt.min)

// Int16 ~ Int64
let int16: Int16 = 100

//uint1 = -100  // UInt 타입은 음의 정수 담지 못한다.

// 진수 별 정수 표현
let decimalInteger = 17         // 10진수
let binaryInteger = 0b10001     // 2진수로 17 (binary)
let octalInteger = 0o21         // 8진수로 17 (octal)
let hexadecimalInteger = 0x11   // 16진수로 17 (hexadecimal)

// 숫자 리터럴 포맷, 가독성을 위해, 실제 언더바는 아무 영향 안끼친다.
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

/// Bool(Boolean)
var boolean: Bool = true
print(boolean)
boolean.toggle()
print(boolean)

/// 부동소수형 타입: Float(32Byte), Double(64Byte)
var floatValue: Float = 3.14
var doubleValue: Double = 3.14159

print(Int.random(in: -100...100))
print(UInt.random(in: 1...300))
print(Double.random(in: 1.5...4.3))
print(Float.random(in: -0.5...1.5))

/// 문자 Character
let alphabet: Character = "a"
print(alphabet)

// 유니코드 문자를 사용할 수 있다.
let commandCharacter: Character = "😟"
print(commandCharacter)

let 한글변수: Character = "😎"
print(한글변수)

// 문자열 String
let name: String = "김민수"
//name = "박민수"    // 문자열 상수로 선언하면 변경 불가

var introduce: String = String()
introduce.append("안녕하세요.")
introduce.append(name)
print(introduce)
print(introduce.count)
print(introduce.isEmpty)

var isSameString: Bool = false
isSameString = name == "김민수"
print(isSameString)

print(name.hasPrefix("김민"))
print(name.hasSuffix("민수"))

var hello = "Hello"
print(hello.uppercased())
print(hello.lowercased())

greeting = """
    안녕하세요.
    저는 채상윤입니다.
    """
print(greeting)

/// 스위프트의 제어문자들
/// \n : 줄바꿈 문자(개행문자)
/// \\ : 문자열 내에서 백슬래시를 표현
/// \" : 문자열 내에서 큰(쌍)타옴표를 표현
/// \t : 탭 문자, 키보드의 탭 키를 눌렀을 때와 같은 효과

print("문자열 내부에서\n줄바꿈을 하고 싶어요.")
print("문자열 내부에서\\줄바꿈\\을 하고 싶어요.")
print("문자열 내부에서\"줄바꿈\"을 하고 싶어요.")
print(#"문자열 내부에서\"줄바꿈\"을 \#(100)하고 싶어요."#)

// MARK: - Any, AnyObject, nil(=null)

// Any
var someAny: Any = 10.111
someAny = "어떤 타입의 값도 할당 가능"
//var someString: String = someAny    // Any도 하나의 타입이기 때문에 다른 타입에 할당하지 못한다.

// AnyObject
class SomeClass2 {}
var someAnyObject: AnyObject = SomeClass2()
//someAnyObject = 10  // AnyObject 타입에는 기본 타입 할당 불가

// nil: 아무것도 없는 값
//someAny = nil   // 컴파일 에러
//someAnyObject = nil   // 컴파일 에러
var someAny2: Any? = 200    // 옵셔널로 만들어줘야 한다.
someAny2 = nil

// MARK: - 데이터 타입 안심(안정성)
/// 서로 다른 타입끼리의 데이터 교환은 꼭 타입캐스팅을 거쳐야 한다.
/// 엄밀히 말하면 새로운 인스턴스를 생성하여 할당한다
var safe1: Int = 100
var safe2: Double = 200.333

//safe2 = safe1   // 형변환을 거치지 않으면 에러가 발생한다.
safe2 = Double(safe1)

print(safe1)
print(safe2)

var name22 = "채상윤"  // 타입 추론을 한다.
let int33 = 100
let double = 333.333    // 기본 부동소수형 타입은 Double
// Float, Double

//int33 = "asdf"  // 타입 추론으로 변수를 선언했더라도 다른 타입을 할당할 수 없다.

// MARK: - 타입 별치 type alias
typealias MyInt = Int
typealias YourInt = Int

var age: MyInt = 10
var myAge: YourInt = 20

myAge = age

typealias MyString = String
var myName: MyString = "김호민"

// 튜플 Tuple: 타입의 이름이 따로 지정되어 있지 않은 프로그래머 마음대로 만드는 타입, 데이터 묶음.
// 컬렉션은 아님

// 튜플의 인덱스를 통해 요소에 접근한다.
var person: (String, Int, Double) = ("조기환", 100, 182.5)
print("이름: \(person.0), 나이: \(person.1), 키: \(person.2)")
person.0 = "김호민"    // 값 수정도 인덱스로 가능하다.

// 튜플의 각 타입의 이름을 통해 요소에 접근한다.
var person2: (name: String, age: Int, height: Double) = ("조기환", 100, 182.5)
print("이름: \(person2.name), 나이: \(person2.age), 키: \(person2.height)")
person2.name = "김호민"    // 값 수정도 인덱스로 가능하다.

typealias PersonTuples = (name: String, age: Int, height: Double)
var person3: PersonTuples = ("조기환", 100, 182.5)

// 페어링 되는 여러개의 값을 동시에 반환 받고 싶을 때
fun11()
func fun11() -> (Int, String) {
    return (100, "김호민")
}

// MARK: - 컬렉션
/// 스위프트의 컬렉션에는 배열(Array), 딕셔너리(Dictionary), 셋(Set)
/// 코틀린과 비교
/// 배열 == 리스트
/// 딕셔너리 == 맵
/// 셋 == 셋

// 배열 Array: 같은 타입의 데이터를 일렬로 나열한 후 순서대로 저장하는 형태의 컬렉션 타입
// let으로 선언하면 수정, 삭제, 추가 불가
// var으로 선언해야 수정, 삭제, 추가 가능하다
var names: Array<String> = ["김호민", "박명수", "이영희"]
var names2: [String] = ["김호민", "박명수", "이영희"]

// 빈 배열
var emptyArray: Array<Int> = [Int]()
var emptyArray2: [Int] = Array<Int>()
var emptyArray3: [Int] = []
print(emptyArray.isEmpty)
print(names.count)

print(names[0])
names[0] = "최지수"
//print(names[4]) // 인덱스의 범위를 벗어나면 컴파일 에러
//names[4] = "최지수" // 인덱스의 범위를 벗어나면 컴파일 에러

names.append("조기환")
names.append(contentsOf: ["조기환", "조기환"])
names.insert("김호민", at: 2)
names.insert(contentsOf: ["조기환", "조기환"], at: 2)

var names4 = ["조기환", "조기환"]
var name5: Int? = names4.firstIndex(of: "조기환")
names.firstIndex(of: "조기환")
names.first
names.last

// 요소를 삭제한 후에 삭제한 요소 반환해준다.
let firstName = names.removeFirst() // last도 마찬가지
let firstName2 = names.remove(at: 2)

print(names4[0...1])    // 범위 연산자 사용

// 딕셔너리 : 요소들이 순서 없이 키와 값의 쌍으로 구성되는 컬렉션 타입
var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()
typealias NameNumberDict = Dictionary<String, Int>
var numberForName2: NameNumberDict = Dictionary<String, Int>()

var numberForName3: [String: Int] = [String: Int]()
var numberForName4: NameNumberDict = NameNumberDict()   // 타입별칭 사용해서 빈 딕셔너리 생성
var numberForName5: [String: Int] = [:]
var numberForName6: [String: Int] = ["조기환": 100, "김호민": 200]

print(numberForName6.isEmpty)
print(numberForName6.count)

//print(numberForName6["조기환"])
//print(numberForName6["김호민"])

numberForName6["조기환"] = 1000
//print(numberForName6["조기환"])

numberForName6["아무개"] = 2000
print(numberForName6)


//print(numberForName6.removeValue(forKey: "김호민"))
print(numberForName6)

print(numberForName6["박수홍", default: 0])

// 셋 Set : 같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬렉션 타입
// 보통 순서가 중요하지 않거나 각 요소가 유일한 값이어야 할 때 사용한다.
var namesSet: Set<String> = Set<String>()
var namesSet2: Set<String> = []

var nameSet3: Set<String> = ["조기환", "김호민", "김호민"]
print(nameSet3)

var nameSet4: Set<String> = ["조기환", "김호민", "김호민"]

// 배열과 컬렉션에서 사용하는 함수 기본적으로 동일
nameSet4.insert("아무개")
//nameSet4.append("조기환")  // 셋에서 .append()는 사용하지 않는다.

nameSet4.remove("아무개")

// 집합연산
let unionSet: Set<String> = ["조기환", "김호민", "아무개"]
let unionSet2: Set<String> = ["조기환", "김호민", "박명수"]

// 교집합
print(unionSet.intersection(unionSet2))
print(unionSet2.intersection(unionSet))

// 여집합
print(unionSet.symmetricDifference(unionSet2))
print(unionSet2.symmetricDifference(unionSet))

// 합집합
print(unionSet.union(unionSet2))
print(unionSet2.union(unionSet))

// 차집합
print(unionSet.subtracting(unionSet2))
print(unionSet2.subtracting(unionSet))

var array: [Int] = [1, 2, 3, 4, 5]
//print(array.randomElement())
print(array.shuffled())
print(array)
array.shuffle()
print(array)

// 열거형
enum School {
    case elementary
    case middle
    case high
}

enum School2 {
    case elementary, middle, high   // 열거형의 케이스는 소문자 카멜케이스로 작성한다.
}

// 열거형 변수 선언
var studentSchool: School = .elementary

// 열거형의 원시값
enum School3: String {
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
}

var studentSchool2: School3 = .elementary
print(studentSchool2.rawValue)
