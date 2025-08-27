//
//  Vote.swift
//  Clazzi
//
//  Created by 채상윤 on 8/27/25.
//

import Foundation

struct Vote: Identifiable {
    var id = UUID()
    let title: String
    let options: [String]
}
