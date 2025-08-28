//
//  MyPageView.swift
//  Clazzi
//
//  Created by 채상윤 on 8/28/25.
//

import SwiftUI

struct MyPageView: View {
    @Binding var currentUserID: UUID?
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("로그인 된 이메일:")
                Text("이메일")
                Button(action: {
                    currentUserID = nil
                    UserDefaults.standard.removeObject(forKey: "currentUserID")
                }) {
                    Text("로그아웃")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            .navigationTitle(Text("마이페이지"))
        }
    }
}

// 옛날 방식
//struct MyPagePreviews: PreviewProvider {
//    struct Wrapper: View {
//        @State var isLoggedIn: Bool = false
//        var body: some View {
//            MyPageView(isLoggedIn: $isLoggedIn)
//        }
//    }
//    
//    static var previews: some View {
//        Wrapper()
//    }
//}

// 최근 방식
#Preview {
    @Previewable @State var currentUserID: UUID? = UUID(uuidString: "fake UUID")
    MyPageView(currentUserID: $currentUserID)
}
