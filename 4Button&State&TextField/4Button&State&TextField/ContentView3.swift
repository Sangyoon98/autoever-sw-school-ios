//
//  ContentView3.swift
//  4Button&State&TextField
//
//  Created by 채상윤 on 8/18/25.
//

import SwiftUI

struct ContentView3: View {
    @State private var name: String = ""
    @State private var email: String = ""
    
    var body: some View {
        Form {
            Text("회원가입")
            Section {
                TextField("이름", text: $name)
                    .textFieldStyle(.roundedBorder)
                TextField("이메일", text: $email)
                    .textFieldStyle(.roundedBorder)
            }
            
            Section {
                TextField("이름", text: $name)
                    .textFieldStyle(.plain)
                TextField("이메일", text: $email)
                    .textFieldStyle(.plain)
            }
            
            Section {
                Button("submit") {
                    print("Name: \(name), Email: \(email)")
                }
            }
        }
        //        .padding()
    }
}

#Preview {
    ContentView3()
}
