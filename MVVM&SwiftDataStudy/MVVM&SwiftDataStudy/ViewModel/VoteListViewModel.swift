//
//  VoteListViewModel.swift
//  MVVMStudy
//
//  Created by 채상윤 on 8/29/25.
//

import Foundation
import SwiftData
import SwiftUI

class VoteListViewModel: ObservableObject {
    @Published /*private*/ var votes: [Vote] = []
    
    private var context: ModelContext?
    
    func setContext(_ context: ModelContext) {
        self.context = context
        fetchVotes()
    }
    
    func fetchVotes() {
        guard let context else { return }
        let descriptor = FetchDescriptor<Vote>()
        if let results = try? context.fetch(descriptor) {
            self.votes = results
        }
    }
    
    var allVotes: [Vote] {
        votes
    }
    
    func getVotes() -> [Vote] {
        votes
    }
    
    func addVote(_ vote: Vote) {
        guard let context else { return }
        context.insert(vote)
        try? context.save()
        fetchVotes()
    }
    
    func deleteVote(vote: Vote) {
        guard let context else { return }
        context.delete(vote)
        try? context.save()
        fetchVotes()
        
    }
    
    func updateVote(_ vote: Vote) {
        guard let context else { return }
        // vote는 이미 SwiftData에서 관리 중인 객체라 속성이 변경되어 있다면 그대로 저장하면 됨
        // 굳이 vote 받아오는 이유는 나중에 Firebase, REST API 대응하기 위해.
        try? context.save()
        fetchVotes()
    }
}
