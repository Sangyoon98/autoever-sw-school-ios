//
//  Vote.swift
//  MVVMStudy
//
//  Created by 채상윤 on 8/29/25.
//

import Foundation
import SwiftData

@Model
class Vote: Identifiable {
    var id: UUID
    var title: String
    var options: [String: Int]  // 옵션과 투표 수
    
    init(id: UUID = UUID(), title: String, options: [String]) {
        self.id = id
        self.title = title
        self.options = Dictionary(uniqueKeysWithValues: options.map { ($0, 0) })    // ($0, 0) -> ("투표 항목", 투표수)
    }
}
