//
//  VoteListViewModel.swift
//  MVVMStudy
//
//  Created by 채상윤 on 8/29/25.
//

import Foundation

class VoteListViewModel: ObservableObject {
    @Published /*private*/ var votes: [Vote] = []
    
    var allVotes: [Vote] {
        votes
    }
    
    func getVotes() -> [Vote] {
        votes
    }
    
    func addVote(_ vote: Vote) {
        votes.append(vote)
    }
    
    func deleteVote(id: UUID) {
        votes.removeAll { $0.id == id }
    }
    
    func updateVote(_ vote: Vote) {
        if let index = votes.firstIndex(where: { $0.id == vote.id }) {
            votes[index] = vote
        }
    }
}
