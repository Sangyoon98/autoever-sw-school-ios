import UIKit

let names = ["폰세", "와이스", "류현진", "윤동주", "황준서"]
let scores = [85, 73, 92, 65, 100]

func getGrade(score: Int) -> String {
    switch score {
    case 90...100:return "A"
    case 80...89: return "B"
    case 70...79: return "C"
    case 60...69: return "D"
    default: return "F"
    }
}

func calculateAverage(scores: [Int]) -> Double {
    let sum = scores.reduce(0, +)
    let average = Double(sum) / Double(scores.count)
    return average
}



func getHighestScore(names: [String], scores: [Int]) -> (name: String, score: Int) {
    var highest = ("", Int.min)
    for i in 0..<scores.count {
        if scores[i] > highest.1 {
            highest = (names[i], scores[i])
        }
    }
    return highest
}

func getLowestScore(names: [String], scores: [Int]) -> (name: String, score: Int) {
    var lowest = ("", Int.max)
    for i in 0..<scores.count {
        if scores[i] < lowest.1 {
            lowest = (names[i], scores[i])
        }
    }
    return lowest
}

func getGradeDistribution(scores: [Int]) -> (a: Int, b: Int, c: Int, d: Int, f: Int) {
    var a = 0, b = 0, c = 0, d = 0, f = 0
    
    for score in scores {
        switch getGrade(score: score) {
        case "A": a += 1
        case "B": b += 1
        case "C": c += 1
        case "D": d += 1
        default: f += 1
        }
    }
    return (a, b, c, d, f)
}

func getHigherAverageStudents(names: [String], scores: [Int]) -> [(name: String, score: Int)] {
    let average = calculateAverage(scores: scores)
    var result: [(String, Int)] = []
    for i in 0..<scores.count {
        if (Double(scores[i]) >= average) {
            result.append((names[i], scores[i]))
        }
    }
    return result
}

func getMostFrequentGrade(scores: [Int]) -> (grade: String, count: Int) {
    let dist = getGradeDistribution(scores: scores)
    let gradeCounts: [(String, Int)] = [
        ("A", dist.a),
        ("B", dist.b),
        ("C", dist.c),
        ("D", dist.d),
        ("F", dist.f)
    ]
    
    var mostFrequent = ("", Int.min)
    for (grade, count) in gradeCounts {
        if count > mostFrequent.1 {
            mostFrequent = (grade, count)
        }
    }
    return mostFrequent
}

print("학생 성적 보고서")
for i in 0..<names.count {
    print("\(names[i]): \(scores[i])점, 등급: \(getGrade(score: scores[i]))")
}
print()
print("평균 점수: \(String(format: "%.2f", calculateAverage(scores: scores)))")
let highest = getHighestScore(names: names, scores: scores)
let lowest = getLowestScore(names: names, scores: scores)
print("최고 점수: \(highest.name) (\(highest.score)점)")
print("최저 점수: \(lowest.name) (\(lowest.score)점)")
print()
print("등급 분포")
let distribution = getGradeDistribution(scores: scores)
print("A: \(distribution.a)명")
print("B: \(distribution.b)명")
print("C: \(distribution.c)명")
print("D: \(distribution.d)명")
print("F: \(distribution.f)명")
print()
let higherAverageStudents = getHigherAverageStudents(names: names, scores: scores)
print("평균 이상 학생: \(higherAverageStudents.map(\.name).joined(separator: ", "))")
let most = getMostFrequentGrade(scores: scores)
print("가장 많은 등급: \(most.grade) (\(most.count)명)")


// MARK: - 강사님 코드
// ---------------------------
// 학생 데이터
// ---------------------------
let names = ["폰세", "와이스", "류현진", "문동주", "황준서"]
let scores = [85, 73, 92, 65, 100]

// ---------------------------
// 1. 점수에 따른 등급 반환 함수
// ---------------------------
func assignGrade(score: Int) -> String {
    switch score {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    case 60..<70:
        return "D"
    default:
        return "F"
    }
}

// ---------------------------
// 2. 평균 점수 계산 함수
// ---------------------------
func calculateAverage(scores: [Int]) -> Double {
    var total = 0
    for score in scores {
        total += score
    }
    return Double(total) / Double(scores.count)
}

// ---------------------------
// 3. 최고 점수 학생 찾기 함수
// ---------------------------
func findMaxStudent(names: [String], scores: [Int]) -> (String, Int) {
    var maxScore = -1
    var maxName = ""
    for i in 0..<scores.count {
        if scores[i] > maxScore {
            maxScore = scores[i]
            maxName = names[i]
        }
    }
    return (maxName, maxScore)
}

// ---------------------------
// 4. 최저 점수 학생 찾기 함수
// ---------------------------
func findMinStudent(names: [String], scores: [Int]) -> (String, Int) {
    var minScore = 101
    var minName = ""
    for i in 0..<scores.count {
        if scores[i] < minScore {
            minScore = scores[i]
            minName = names[i]
        }
    }
    return (minName, minScore)
}

// ---------------------------
// 5. 등급 분포 카운트 함수
// ---------------------------
func countGrades(scores: [Int]) -> (Int, Int, Int, Int, Int) {
    var gradeA = 0, gradeB = 0, gradeC = 0, gradeD = 0, gradeF = 0
    for score in scores {
        switch score {
        case 90...100: gradeA += 1
        case 80..<90: gradeB += 1
        case 70..<80: gradeC += 1
        case 60..<70: gradeD += 1
        default: gradeF += 1
        }
    }
    return (gradeA, gradeB, gradeC, gradeD, gradeF)
}

// ---------------------------
// 6. 평균 이상 학생 찾기 함수
// ---------------------------
func findAboveAverage(names: [String], scores: [Int], average: Double) -> [String] {
    var result = [String]()
    for i in 0..<names.count {
        if Double(scores[i]) >= average {
            result.append(names[i])
        }
    }
    return result
}

// ---------------------------
// 7. 가장 많은 등급 찾기 함수
// ---------------------------
func findMostFrequentGrade(gradeCounts: (Int, Int, Int, Int, Int)) -> (String, Int) {
    let grades = ["A", "B", "C", "D", "F"]
    let counts = [gradeCounts.0, gradeCounts.1, gradeCounts.2, gradeCounts.3, gradeCounts.4]
    var maxCount = -1
    var maxGrade = ""
    for i in 0..<counts.count {
        if counts[i] > maxCount {
            maxCount = counts[i]
            maxGrade = grades[i]
        }
    }
    return (maxGrade, maxCount)
}

// ---------------------------
// 메인 실행 부분
// ---------------------------
print("학생 성적 보고서")
for i in 0..<names.count {
    let grade = assignGrade(score: scores[i])
    print("\(names[i]): \(scores[i])점, 등급: \(grade)")
}

let average = calculateAverage(scores: scores)
let (maxName, maxScore) = findMaxStudent(names: names, scores: scores)
let (minName, minScore) = findMinStudent(names: names, scores: scores)

print("\n평균 점수: \(String(format: "%.2f", average))")
print("최고 점수: \(maxName) (\(maxScore)점)")
print("최저 점수: \(minName) (\(minScore)점)")

let gradeCounts = countGrades(scores: scores)
print("\n등급 분포")
print("A: \(gradeCounts.0)명")
print("B: \(gradeCounts.1)명")
print("C: \(gradeCounts.2)명")
print("D: \(gradeCounts.3)명")
print("F: \(gradeCounts.4)명")

let aboveAverage = findAboveAverage(names: names, scores: scores, average: average)
print("\n평균 이상 학생: \(aboveAverage.joined(separator: ", "))")

let (mostGrade, mostCount) = findMostFrequentGrade(gradeCounts: gradeCounts)
print("가장 많은 등급: \(mostGrade) (\(mostCount)명)")
