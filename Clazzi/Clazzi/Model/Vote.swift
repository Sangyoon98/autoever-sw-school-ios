//
//  Vote.swift
//  Clazzi
//
//  Created by 채상윤 on 8/27/25.
//

import Foundation
import SwiftData

@Model  // 스위프트 데이터에서 사용할 수 있는 모델로 바꿔주는 Attribute
class Vote: Identifiable {
    var id = UUID()
    var title: String
    var options: [String]
    
    init(title: String, options: [String]) {
        self.title = title
        self.options = options
    }
}
