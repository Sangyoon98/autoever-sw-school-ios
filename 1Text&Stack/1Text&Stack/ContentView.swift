//
//  ContentView.swift
//  1Text&Stack
//
//  Created by 채상윤 on 8/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("텍스트")
        Text("Placeholder")
            .font(.title)
        Text("Placeholder2")
            .font(.system(size: 24))
        Text("안녕하세요.")
            .font(.body)
    }
}

#Preview {
    ContentView()
}
