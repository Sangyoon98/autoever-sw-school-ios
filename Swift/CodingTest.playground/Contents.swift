import UIKit

// MARK: - 문제: 제네릭 상(Pair) 클래스 비교하기

class Pair<T: Equatable, U: Equatable>: Equatable {
    var first: T
    var second: U
    
    init(first: T, second: U) {
        self.first = first
        self.second = second
    }
    
    static func == (lhs: Pair<T, U>, rhs: Pair<T, U>) -> Bool {
        return lhs.first == rhs.first && lhs.second == rhs.second
    }
    
    func isEqual(_ other: Pair<T, U>) -> Bool {
        return self == other
    }
}

let pair1 = Pair(first: 42, second: "Hello")
let pair2 = Pair(first: 42, second: "Hello")
let pair3 = Pair(first: 100, second: "World")
let pair4 = Pair(first: "Swift", second: true)
let pair5 = Pair(first: "Swift", second: true)
let pair6 = Pair(first: "Swift", second: false)

print("pair1 == pair2 ? \(pair1 == pair2)")
print("pair1 == pair3 ? \(pair1 == pair3)")
print("pair4 == pair5 ? \(pair4 == pair5)")
print("pair4 == pair6 ? \(pair4 == pair6)")

// MARK: - 문제: 클로저로 배열 처리

func processArray(_ numbers: [Int], using transform: (Int) -> Int) -> [Int] {
    return numbers.map(transform)
}

let arr1 = [1, 2, 3, 4]
print("테스트 1: 각 요소를 2배로 만들기")
print("원본 배열: \(arr1)")
let result1 = processArray(arr1) { $0 * 2 }
print("2배 결과: \(result1)")

let arr2 = [11, 12, 13, 14]
print("테스트 2: 각")
// MARK: - 문제: 점수 처리 시스템
