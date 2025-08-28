//
//  VoteListView.swift
//  Clazzi
//
//  Created by 채상윤 on 8/26/25.
//

import SwiftUI
import SwiftData

struct VoteListView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Binding var currentUserID: UUID?
    
    // 스위프트 데이터에서 가져오기
    @Query(sort: \Vote.title, order: .forward) private var votes: [Vote]
    
    //    @State private var votes = [
    //        Vote(title: "첫 번째 투표", options: [
    //            "옵션 1",
    //            "옵션 2"
    //        ]),
    //        Vote(title: "두 번째 투표", options: [
    //            "옵션 1",
    //            "옵션 2"
    //        ]),
    //    ]
    
    // 투표 생성 관련
    @State private var isPresentingCreate = false
    // 투표 수정 관련
    @State private var isPresentingEdit = false
    
    // 투표 삭제 관련
    @State private var showDeleteAlert = false
    @State private var voteToDelete: Vote? = nil
    
    // 투표 수정 관련
    @State private var voteToEdit: Vote? = nil
    //    @State private var editIndex: Int? = nil
    
    
    var body: some View {
        NavigationStack {
            // 리스트로 요소 삭제하는 방법
            //            List {
            //                LazyVStack(spacing: 16) {
            //                    ForEach(votes) {vote in
            //                        NavigationLink(destination: VoteView(vote: vote)) {
            //                            VoteCardView(vote: vote)
            //                        }
            //                    }
            //                    .onDelete { indexSet in
            //                        votes.remove(atOffsets: indexSet)
            //                    }
            //                }
            //            }
            
            ZStack {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(votes) {vote in
                            //                            let vote = votes[index]
                            NavigationLink(destination: VoteView(vote: vote, currentUserID: $currentUserID)) {
                                VoteCardView(vote: vote) {
                                    voteToDelete = vote
                                    showDeleteAlert = true
                                } onEdit: {
                                    voteToEdit = vote
                                    //                                    editIndex = index
                                    isPresentingEdit = true
                                }
                            }
                        }
                    }
                    
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            isPresentingCreate = true
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .padding(24)
                                .background(.blue)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding()
                    }
                }
            }
            .padding()
            .navigationBarTitle("투표 목록 화면")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // 화면 이동 방법 1: 툴바 네비게이션 링크
                    //                    NavigationLink(destination: CreateVoteView()) {
                    //                        Image(systemName: "plus")
                    //                    }
                    
                    // 화면 이동 방법 2: 상태를 이용한 이동 방법
                    //                    Button(action: {
                    //                        isPresentingCreate = true
                    //                    }) {
                    //                        Image(systemName: "plus")
                    //                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: MyPageView(currentUserID: $currentUserID)) {
                        Image(systemName: "person")
                    }
                }
            }
            // 화면 이동 방법 2: 상태를 이용한 이동 방법
            .navigationDestination(isPresented: $isPresentingCreate) {
                VoteEditorView() { vote in
                    //                    votes.append(vote)
                    modelContext.insert(vote)
                    do {
                        try modelContext.save()
                    } catch {
                        print("저장 실패: \(error)")
                    }
                }
            }
            
            // 수정화면 띄우기
            .navigationDestination(isPresented: $isPresentingEdit) {
                if let vote = voteToEdit {
                    VoteEditorView(vote: vote) { updatedVote in
                        do {
                            try modelContext.save()
                        } catch {
                            print("수정 실패: \(error)")
                        }
                        //                        votes[index] = updatedVote
                    }
                }
            }
            
            // 모달(바텀 시트)를 활용한 화면 띄우는 방법(상태 이용)
            //            .sheet(isPresented: $isPresentingCreate) {
            //                CreateVoteView() { vote in
            //                    votes.append(vote)
            //                }
            //            }
            
            // 삭제 알러트
            .alert("투표를 삭제하시겠습니까?", isPresented: $showDeleteAlert) {
                Button("삭제", role: .destructive) {
                    if let target = voteToDelete {
                        modelContext.delete(target)
                        do {
                            try modelContext.save()
                            voteToDelete = nil// 삭제 후 상태 초기화
                        } catch {
                            print("삭제 실패: \(error)")
                        }
                        //                        votes.remove(at: index)
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

// 옛날 방식
//struct VoteListPreviews: PreviewProvider {
//    struct Wrapper: View {
//        @State var isLoggedIn: Bool = false
//        
//        let container: ModelContainer = {
//            let schema = Schema([Vote.self, VoteOption.self])
//            let config = ModelConfiguration(isStoredInMemoryOnly: true)
//            let container = try! ModelContainer(for: schema, configurations: [config])
//            
//            // 더미 데이터
//            let context = container.mainContext
//            // 샘플 데이터 추가
//            let sampleVote1 = Vote(title: "샘플 투표 1", options: [
//                VoteOption(name: "옵션 1"),
//                VoteOption(name: "옵션 2")
//            ])
//            let sampleVote2 = Vote(title: "샘플 투표 2", options: [
//                VoteOption(name: "옵션 A"),
//                VoteOption(name: "옵션 B")
//            ])
//            context.insert(sampleVote1)
//            context.insert(sampleVote2)
//            return container
//        }()
//        
//        var body: some View {
//            VoteListView(isLoggedIn: $isLoggedIn)
//                .modelContainer(container)
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
    
    do {
        // 인메모리 ModelContainer 생성
        let container = try ModelContainer(
            for: Vote.self, VoteOption.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        
        // 샘플 데이터 추가
        let sampleVote1 = Vote(title: "샘플 투표 1", options: [
            VoteOption(name: "옵션 1"),
            VoteOption(name: "옵션 2")
        ])
        let sampleVote2 = Vote(title: "샘플 투표 2", options: [
            VoteOption(name: "옵션 A"),
            VoteOption(name: "옵션 B")
        ])
        container.mainContext.insert(sampleVote1)
        container.mainContext.insert(sampleVote2)
        
        // 모든 객체가 삽입된 후 저장
        try container.mainContext.save()
        
        return VoteListView(currentUserID: $currentUserID)
            .modelContainer(container)
    } catch {
        fatalError("프리뷰용 ModelContainer 초기화 실패: (error.localizedDescription)")
    }
}
