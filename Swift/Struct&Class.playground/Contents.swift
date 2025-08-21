import UIKit

// 구조체와 클래스는 프로그래머가 데이터와 기능을 용도에 맞게 묶어 표현하고자 할 때 사용한다.
// - 구조체: 값 타입
// - 클래스: 참조 타입

// MARK: - struct(구조체)

struct Sample {
    // 가변 프로퍼티
    var mutableProperty: Int = 100
    // 불변 프로퍼티
    let immutableProperty: Int = 200
    // 타입 프로퍼티
    static let typeProperty: Int = 300
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("인스턴스 메서드")
    }
    
    // 타입 메서드
    static func typeMethod() {
        print("타입 메서드")
    }
}

// 가변 인스턴스 생성
var mutable: Sample = Sample()
mutable.mutableProperty = 1000
print("mutable.mutableProperty: \(mutable.mutableProperty)")
//mutable.immutableProperty = 2000  // 불변 프로퍼티(let)는 수정 불가

// 불변 인스턴스 생성
let immutable: Sample = Sample()
//immutable.mutableProperty = 1000  // 불변 인스턴스는 프로퍼티 수정이 불가
//immutable.immutableProperty = 2000  // 불변 인스턴스는 프로퍼티 수정이 불가

// 타입 프로퍼티에 접근
print("Sample.typeProperty: \(Sample.typeProperty)")
Sample.typeMethod()
