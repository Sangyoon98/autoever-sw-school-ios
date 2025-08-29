//
//  VoteViewModel.swift
//  MVVMStudy
//
//  Created by 채상윤 on 8/29/25.
//

import Foundation

class VoteViewModel: ObservableObject {
    @Published var vote: Vote = Vote(id: UUID(), title: "원래 뷰모델 투표 제목")
}
