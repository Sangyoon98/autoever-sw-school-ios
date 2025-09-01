//
//  ClazziFirebaseApp.swift
//  ClazziFirebase
//
//  Created by 채상윤 on 9/1/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct ClazziFirebaseApp: App {
    // 로그인 상태
    @State var currentUser: FirebaseAuth.User? = nil
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Group {
                if currentUser == nil {
                    AuthView(currentUser: $currentUser)
                } else {
                    VoteListView(currentUser: $currentUser)
                }
            }
            .onAppear {
                Task {
                    currentUser = Auth.auth().currentUser
                }
            }
        }
    }
}
