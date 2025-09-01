//
//  ContentView.swift
//  Clazzi
//
//  Created by 채상윤 on 8/26/25.
//

import SwiftUI
import SwiftData

struct VoteView: View {
    // 뒤로 가기
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var selectedOption: Int = 0
    
    @Bindable var vote: Vote
    
    @Binding var currentUserID: UUID?
    
    // 현재 유저가 이미 투표 했는지
    private var hasVoted: Bool {
        guard let userID = currentUserID else { return false }
        return vote.options.contains { $0.voters.contains(userID) }
    }
    
    // 토스트 메시지
    @State private var toastMessage: String? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    
                    Text(vote.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    
                    ForEach(vote.options.indices, id: \.self) { index in
                        Button(action: {
                            selectedOption = index
                        }) {
                            HStack {
                                Text(vote.options[index].name)
                                Spacer()
                                Text("\(vote.options[index].votes)")
                                
                                // 이미 투표한 경우 표시
                                if vote.options[index].voters.first(where: { $0 == currentUserID }) != nil {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.yellow)
                                }
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: 200)
                            .padding()
                            .background(index == selectedOption ? Color.green : Color.gray.opacity(0.5))
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                        }
                        .disabled(hasVoted)
                    }
                    
                    Spacer()
                    
                    // 투표하기
                    Button(action: {
                        guard let currentUserID = currentUserID, !hasVoted else {
                            // 토스트 노출
                            toastMessage = "이미 투표했거나 유저 ID가 없습니다."
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    toastMessage = nil
                                }
                            }
                            
                            return
                        }
                        
                        // 투표 데이터 업데이트
                        vote.options[selectedOption].voters.append(currentUserID)
                        
                        // 모델 컨텍스트에 변경 사항 저장
                        do {
                            try modelContext.save()
                            print("투표 저장 성공: \(vote.options[selectedOption].name)")
                        } catch {
                            print("투표 저장 실패: \(error)")
                        }
                    }) {
                        Text("투표하기")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(hasVoted ? .gray : Color.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .disabled(hasVoted)
                }
                
                if let toastMessage = toastMessage {
                    ToastView(message: toastMessage)
                }
            }
            .padding()
            .navigationTitle(Text("투표 화면"))
        }
    }
}

#Preview {
    // 가짜 사용자 로그인 상태
    @Previewable @State var currentUserID: UUID? = UUID()
    
    // 1. 프리뷰 전용 inMemory 컨테이너 생성
    let container = try! ModelContainer(
        for: Vote.self, VoteOption.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    
    // 2. 샘플 투표 생성
    let sampleVote = Vote(title: "샘플 투표", options: [
        VoteOption(name: "옵션 1"),
        VoteOption(name: "옵션 2")
    ])
    
    // 3. 샘플 투표 삽입
    container.mainContext.insert(sampleVote)
    
    // 4. 뷰에 컨테이너 주입
    return VoteView(vote: sampleVote, currentUserID: $currentUserID)   // 가짜 사용자 ID 주입
        .modelContainer(container)
}
