//
//  VoteViewModel.swift
//  MVVMStudy
//
//  Created by 채상윤 on 8/29/25.
//

import Foundation

class VoteViewModel: ObservableObject {
    @Published var vote: Vote
    
    init(vote: Vote) {
        self.vote = vote
    }
    
    func voteForOption(_ option: String) {
        vote.options[option, default: 0] += 1
//        if let count = vote.options[option] {
//            vote.options[option] = count + 1
//        }
    }
}
