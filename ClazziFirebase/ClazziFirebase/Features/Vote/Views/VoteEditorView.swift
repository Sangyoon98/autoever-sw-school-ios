//
//  VoteEditorView.swift
//  Clazzi
//
//  Created by 채상윤 on 8/26/25.
//

import SwiftUI
import SwiftData

struct VoteEditorView: View {
    @EnvironmentObject var session: UserSession
    // 뒤로 가기 (모달(바텀 시트) 닫기)
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var options: [String] = ["", ""]
    
    // 투표 목록 화면에서 전달해줄 콜백 메서드
    var onSave: (Vote) -> Void
    
    private var vote: Vote? = nil
    
    // 토스트 메세지
    @State var toastMessage: String? = nil
    
    init(vote: Vote? = nil, onSave: @escaping (Vote) -> Void) {
        self.vote = vote
        self.onSave = onSave
        // 수정일 경우 초기값 설정
        self.title = vote?.title ?? ""
        self.options = vote?.options.map { $0.name } ?? ["", ""]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ScrollView {
                        VStack(alignment: .leading) {
                            TextField("투표 제목", text: $title)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .padding(.bottom, 32)
                            Text("투표 항목")
                                .font(.headline)
                            
                            ForEach(options.indices, id: \.self) { index in
                                TextField("항목 \(index + 1)", text: $options[index])
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            
                            Button("항목 추가") {
                                options.append("")
                            }
                            .buttonStyle(.bordered)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            Spacer()
                            
                        }
                    }
                    .navigationTitle(Text(vote == nil ? "투표 생성 화면" : "투표 수정 화면"))
    //                .navigationTitle(Text("투표 \(existingVote == nil ? "생성" : "수정") 화면"))
                    .onAppear {
                        if let vote = vote {
                            title = vote.title
                            options = vote.options.map { $0.name }
                        }
                    }
                    
                    // 생성, 수정하기 버튼
                    Button(action: {
                        /// 투표 제목 검사
                        // 타이틀 앞뒤 공백(개행문자 포함) 제거
                        let title = title.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !title.isEmpty else {
                            toastMessage = "제목을 정확히 입력해주세요."
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    toastMessage = nil
                                }
                            }
                            return
                        }
                        
                        /// 투표 항목 검사
                        let options = options.map { option in
                            option.trimmingCharacters(in: .whitespacesAndNewlines)
                        }.filter { !$0.isEmpty }
                        
                        guard options.count >= 2 else {
                            toastMessage = "투표 항목은 빈 칸 제외한 두 개 이상이어야 합니다."
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    toastMessage = nil
                                }
                            }
                            return
                        }
                        
                        if var vote = vote {    // 투표 수정
                            // 기존 객체를 직접 수정
                            vote.title = title
                            
                            // 기존 옵션 삭제 후 새로 생성
                            vote.options = options.map { VoteOption(name: $0) }
                            onSave(vote)
                        } else {    // 투표 생성
                            let newVote = Vote(title: title, createdBy: session.user?.uid ?? "", options: options.map { VoteOption(name: $0) })
                            onSave(newVote)
                        }
                        dismiss()
                    }) {
                        Text(vote == nil ? "생성하기" : "수정하기")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                
                if let toastMessage = toastMessage {
                    ToastView(message: toastMessage)
                }
            }
            .padding()
        }
    }
}
