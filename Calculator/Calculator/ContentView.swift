//
//  ContentView.swift
//  Calculator
//
//  Created by 채상윤 on 8/20/25.
//

import SwiftUI

struct ContentView: View {
    @State var display: String = "0"
    @State var inputA: String = ""
    @State var inputB: String = ""
    
    // 버튼 레이블 배열
    let labels/*: Array<String>*/ = [
        "7", "8", "9", "/",
        "4", "5", "6", "*",
        "1", "2", "3", "-",
        "0", ".", "=", "+"
    ]
    
    var body: some View {
        VStack {
            Text(display)
                .padding()
                .background(Color.gray.opacity(0.2))
            
            let array = Array(repeating: GridItem(.flexible(), spacing: 12), count: 4)
//            let array = [GridItem(.flexible()), GridItem(.flexible()),
//                           GridItem(.flexible()), GridItem(.flexible())]
            
            LazyVGrid(columns: array) {
                ForEach(labels, id: \.self) { label in
                    Button(action: {
                        display += label
                    }) {
                        Text(label)
                            .font(.headline)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            
            TextField("Input A", text: $inputA)
                .textFieldStyle(.roundedBorder)
                .padding()
            TextField("Input B", text: $inputB)
                .textFieldStyle(.roundedBorder)
                .padding()
            HStack {
                Button("+") {
                    let a = Int(inputA)!
                    let b = Int(inputB)!
                    let displayInt = a + b
                    display = String(displayInt)
                }
                .buttonStyle(.borderedProminent)
                
                Button("-") {
                    let a = Int(inputA)!
                    let b = Int(inputB)!
                    let displayInt = a - b
                    display = String(displayInt)
                }
                .buttonStyle(.borderedProminent)
                
                Button("*") {
                    let a = Int(inputA)!
                    let b = Int(inputB)!
                    let displayInt = a * b
                    display = String(displayInt)
                }
                .buttonStyle(.borderedProminent)
                
                Button("/") {
                    let a = Int(inputA)!
                    let b = Int(inputB)!
                    let displayInt = a / b
                    display = String(displayInt)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
