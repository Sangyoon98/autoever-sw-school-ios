//
//  VoteEditorView.swift
//  Clazzi
//
//  Created by 채상윤 on 8/26/25.
//

import SwiftUI
import SwiftData

struct VoteEditorView: View {
    // 뒤로 가기 (모달(바텀 시트) 닫기)
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var options: [String] = ["", ""]
    
    // 투표 목록 화면에서 전달해줄 콜백 메서드
    var onSave: (Vote) -> Void
    
    private var existingVote: Vote?
    
    init(vote: Vote? = nil, onSave: @escaping (Vote) -> Void) {
        self.existingVote = vote
        self.onSave = onSave
        
        if let vote = vote {
            _title = State(initialValue: vote.title)
            _options = State(initialValue: vote.options.map { $0.name })
        }
    }
    
    var body: some View {
        NavigationStack {
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
                .navigationTitle(Text(existingVote == nil ? "투표 생성 화면" : "투표 수정 화면"))
                .navigationTitle(Text("투표 \(existingVote == nil ? "생성" : "수정") 화면"))
                
                // 생성, 수정하기 버튼
                Button(action: {
                    if let vote = existingVote {
                        // 기존 객체를 직접 수정
                        vote.title = title
                        
                        // 기존 옵션 삭제 후 새로 생성
                        vote.options = options.map { VoteOption(name: $0) }
                        onSave(vote)
                    } else {
                        let newVote = Vote(title: title, options: options.map { VoteOption(name: $0) })
                        onSave(newVote)
                    }
                    dismiss()
                }) {
                    Text(existingVote == nil ? "생성하기" : "수정하기")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

#Preview {
//    do {
//        // 인메모리 ModelContainer 생성
//        let container = try ModelContainer(
//            for: Vote.self, VoteOption.self,
//            configurations: ModelConfiguration(isStoredInMemory: true)
//        )
//        
//        // 샘플 데이터 추가
//        let sampleVote1 = Vote(title: "샘플 투표 1", options: [
//            VoteOption(name: "옵션 1"),
//            VoteOption(name: "옵션 2")
//        ])
//        
//        let sampleVote2 = Vote(title: "샘플 투표 2", options: [
//            VoteOption(name: "옵션 1"),
//            VoteOption(name: "옵션 2")
//        ])
//        
//        container.mainContext.insert(sampleVote1)
//        container.mainContext.insert(sampleVote2)
//        
//        // 모든 객체가 삽입된 후 저장
//        try container.mainContext.save()
//        
//        return VoteListView()
//            .modelContainer(container)
//    } catch {
//        fatalError("프리뷰용 ModelContainer 초기화 실패: \(error.localizedDescription)")
//    }
    VoteEditorView() { _ in }
}
