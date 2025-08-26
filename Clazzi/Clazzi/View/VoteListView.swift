//
//  VoteListView.swift
//  Clazzi
//
//  Created by 채상윤 on 8/26/25.
//

import SwiftUI

struct VoteListView: View {
    let votes = ["첫 번째 투표", "두 번째 투표", "세 번째 투표"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(votes, id: \.self) {vote in
                        VoteCardView(vote: vote)
                    }
                }
            }
            .padding()
            .navigationBarTitle("투표 목록 화면")
        }
    }
}

struct VoteCardView: View {
    let vote: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(vote)
                .font(.headline)
                .foregroundColor(.white)
            Text("투표 항목 보기")
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.gray)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    VoteListView()
}
