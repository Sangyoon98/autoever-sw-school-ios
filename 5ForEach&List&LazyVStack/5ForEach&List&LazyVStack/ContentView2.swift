//
//  ContentView2.swift
//  5ForEach&List&LazyVStack
//
//  Created by 채상윤 on 8/19/25.
//

import SwiftUI

struct Fruit2: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct ContentView2: View {
//    let fruits = ["사과", "바나나", "오렌지"]
    let fruits = [
        Fruit2(name: "사과", imageName: "applelogo"),
        Fruit2(name: "바나나", imageName: "leaf"),
        Fruit2(name: "오렌지", imageName: "sun.max.fill")
    ]
    
    var body: some View {
//        List {
//            Text("아이템 0")
//            Text("아이템 0")
//            
//            Section {
//                Text("아이템 1")
//            }
//            
//            Section(header: Text("헤더")) {
//                Text("아이템 2")
//                Text("아이템 3")
//            }
//            
//            Section {
//                Text("아이템 4")
//                Text("아이템 5")
//            }
//            
//           Text("아이템 6")
//           Text("아이템 7")
//        }
        
        // 문자열(String) 배열은 유니크한 id 값이 없기 때문에 에러남
//        List(fruits) { fruit in
//            Text(fruit)
//        }
        
//        List(fruits, id: \.self) { fruit in
//            Text(fruit)
//        }
        
        List(fruits) { fruit in
            HStack {
                Image(systemName: fruit.imageName)
                Text(fruit.name)
            }
        }
    }
}

#Preview {
    ContentView2()
}
