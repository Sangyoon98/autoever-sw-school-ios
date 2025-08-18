//
//  ContentView2.swift
//  1Text&Stack
//
//  Created by 채상윤 on 8/18/25.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        ZStack {    // ZStack은 맨 밑에서부터 순서대로 자식뷰들이 쌓인다.
            Text("Hello, World!1")
                .background(Color.red)
            Text("Hello, World!2")
            Text("Hello, World!3")
            Text("Hello, World!4")
                .background(Color.blue)
        }
    }
}

#Preview {
    ContentView2()
}
