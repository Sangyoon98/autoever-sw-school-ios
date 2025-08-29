//
//  VoteView.swift
//  MVVMStudy
//
//  Created by 채상윤 on 8/29/25.
//

import SwiftUI

struct VoteView: View {
    @Bindable var vote: Vote    // SwiftData 모델은 @Bindable로 바인딩
    @State var showingEdit = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(vote.title)
                    .font(.title)
                    .padding()
                
                ForEach(Array(vote.options.keys.sorted()), id: \.self) { option in
                    HStack {
                        Text(option)
                        Spacer()
                        Text("\(vote.options[option] ?? 0)표")
                        Button(action: {
                            vote.options[option, default: 0] += 1
                        }) {
                            Text("투표하기")
                                .padding()
                                .background(Color.blue)
                                .foregroundStyle(.white)
                                .clipShape(Capsule())
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("투표 화면")
            .toolbar {
                Button("수정") {
                    showingEdit = true
                }
            }
            .sheet(isPresented: $showingEdit) {
                VoteEditorView(viewModel: VoteEditorViewModel(vote: vote)) { updateVote in
                    vote.title = updateVote.title
                    vote.options = updateVote.options
                }
            }
        }
    }
}

#Preview {
    VoteView(vote: Vote(title: "테스트 투표", options: ["항목 1", "항목 2"]))
}
