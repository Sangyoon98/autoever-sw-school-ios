//
//  ContentView3.swift
//  8StateManagement
//
//  Created by 채상윤 on 8/19/25.
//

// 값 타입
// Kotlin -> data class()
struct TestStruct {
    var value = 0
}

// 참조 타입
class TestClass {
    var value = 0
}

let class1 = TestClass()
let class2 = class1

let struct1 = TestStruct()
let struct2 = struct1
