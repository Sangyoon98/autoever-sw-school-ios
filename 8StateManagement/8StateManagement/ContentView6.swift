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
        Text("사용자: \(settings.username)")
    }
}

#Preview {
    ContentView6()
        .environmentObject(UserSettings())  // 전역으로 상태 공유
}
