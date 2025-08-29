//
//  VoteView.swift
//  MVVMStudy
//
//  Created by 채상윤 on 8/29/25.
//

import SwiftUI

struct VoteView: View {
    // @State: 간단한 값의 상태 속성 래퍼. 구조체로 되어있는 것들은 @State를 붙여준다.
    @State var text: String = "원래 텍스트"
    // @StateObject: 클래스로 되어있는 것들은 @StateObject를 붙여준다.
    @StateObject var viewModel = VoteViewModel()
    // 스위프트에서 제공하는 구조체 타입(String, Int, Bool 등)이 아닌
    // 직접 만든 구조체일 경우에도 @State로 상태를 만들어준다.
    @State var vote: Vote = Vote(id: UUID(), title: "구조체 Vote 원래 제목")
    
    var body: some View {
        NavigationStack {
            Text(viewModel.vote.title)
            Text(text)
            Text(vote.title)
            Button("투표 제목, 텍스트 바꾸기") {
                viewModel.vote.title = "새로운 투표 제목"
                text = "새로운 텍스트"
                vote.title = "구조체 Vote 새로운 제목"
            }
            .padding(.bottom, 40)
            ChildView(text: $text, viewModel: viewModel)
            
            NavigationLink("SecondView로 이동") {
                SecondView(text: $text, viewModel: viewModel)
            }
            .padding(.top, 40)
        }
    }
}

struct ChildView: View {
    @Binding var text: String
    @ObservedObject var viewModel: VoteViewModel
    
    var body: some View {
        Text("ChildView")
        Text(text)
        Text(viewModel.vote.title)
        Button("수정") {
            text = "새로운 텍스트"
            viewModel.vote.title = "새로운 뷰모델 투표 제목"
        }
    }
}

struct SecondView: View {
    @Binding var text: String
    @ObservedObject var viewModel: VoteViewModel
    
    var body: some View {
        Text("SecondView")
        Text(text)
        Text(viewModel.vote.title)
        Button("수정") {
            text = "새로운 텍스트"
            viewModel.vote.title = "새로운 뷰모델 투표 제목"
        }
    }
}

#Preview {
    VoteView()
}
