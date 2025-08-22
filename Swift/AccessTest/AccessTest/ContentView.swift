//
//  ContentView.swift
//  AccessTest
//
//  Created by 채상윤 on 8/22/25.
//

import SwiftUI
import MyModule

let module = ModuleTest()

class TestClass: ModuleTest {
    
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
