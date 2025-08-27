//
//  Vote.swift
//  Clazzi
//
//  Created by 채상윤 on 8/27/25.
//

import Foundation
import SwiftData

@Model  // 스위프트 데이터에서 사용할 수 있는 모델로 바꿔주는 Attribute
class Vote {
    var id = UUID()
    var title: String
    @Relationship(deleteRule: .cascade)
    var options: [VoteOption]
    
    init(title: String, options: [VoteOption] = []) {
        self.title = title
        self.options = options
    }
}

@Model
class VoteOption {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
