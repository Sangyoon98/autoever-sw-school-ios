//
//  VoteListView.swift
//  Clazzi
//
//  Created by 채상윤 on 8/26/25.
//

import SwiftUI
import FirebaseAuth

struct VoteListView: View {
    @EnvironmentObject var session: UserSession
    @StateObject private var voteViewModel = VoteViewModel()
    
    // 투표 생성 관련
    @State private var isPresentingCreate = false
    
    // 투표 수정 관련
    @State private var isPresentingEdit = false
    @State private var voteToEdit: Vote? = nil
    
    // 투표 삭제 관련
    @State private var showDeleteAlert = false
    @State private var voteToDelete: Vote? = nil
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(voteViewModel.votes) {vote in
                        NavigationLink(destination: VoteView(vote: vote)) {
                            VoteCardView(vote: vote) {
                                voteToDelete = vote
                                showDeleteAlert = true
                            } onEdit: {
                                voteToEdit = vote
                                isPresentingEdit = true
                            }
                        }
                    }
                }
                
            }
            .padding()
            .navigationBarTitle("투표 목록 화면")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: VoteEditorView { newVote in
                        voteViewModel.createVote(newVote)
                    }) {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: MyPageView()) {
                        Image(systemName: "person")
                    }
                }
            }
            // 화면 이동 방법 2: 상태를 이용한 이동 방법
//            .navigationDestination(isPresented: $isPresentingCreate) {
//                VoteEditorView() { vote in
//                    //                    votes.append(vote)
//                    modelContext.insert(vote)
//                    do {
//                        try modelContext.save()
//                    } catch {
//                        print("저장 실패: \(error)")
//                    }
//                }
//            }
            
            // 수정화면 띄우기
            .navigationDestination(isPresented: $isPresentingEdit) {
                if let vote = voteToEdit {
                    VoteEditorView(vote: vote) { updatedVote in
                        voteViewModel.updateVote(updatedVote)
                    }
                }
            }
            
            // 삭제 알러트
            .alert("투표를 삭제하시겠습니까?", isPresented: $showDeleteAlert) {
                Button("삭제", role: .destructive) {
                    if let vote = voteToDelete {
                        voteViewModel.deleteVote(vote)
                        voteToDelete = nil
                    }
                }
                Button("취소", role: .cancel) {
                    voteToDelete = nil // 취소 시 상태 초기화
                }
            } message: {
                if let target = voteToDelete {
                    Text("'\(target.title)' 투표가 삭제됩니다.")
                }
            }
        }
    }
}

struct VoteCardView: View {
    let vote: Vote
    let onDelete: () -> Void
    let onEdit: () -> Void
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(vote.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("투표 항목 보기")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            Spacer()
            Button(action: { onEdit() }) {
                Image(systemName: "pencil")
                    .foregroundStyle(.white)
            }
            Button(action: { onDelete() }) {
                Image(systemName: "trash")
                    .foregroundStyle(.white)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.gray)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}
