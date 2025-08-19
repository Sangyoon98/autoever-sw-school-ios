//
//  ContentView6.swift
//  8StateManagement
//
//  Created by 채상윤 on 8/19/25.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var username = "Guest"
}

struct ContentView6: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        Child()
        Child2()
    }
}

struct Child: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        Text("사용자: \(settings.username)")
        Button("Username 변경") {
            settings.username = "Sangyoon"
        }
    }
}

struct Child2: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        Text("사용자: \(settings.username)")
        Button("Username 변경") {
            settings.username = "Sangyoon"
        }
    }
}

#Preview {
    ContentView6()
        .environmentObject(UserSettings())  // 전역으로 상태 공유
}
