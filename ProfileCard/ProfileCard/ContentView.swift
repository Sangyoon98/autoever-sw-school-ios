//
//  ContentView.swift
//  ProfileCard
//
//  Created by 채상윤 on 8/18/25.
//

import SwiftUI

struct ProfileCardView: View {
    var body: some View {
        VStack {
            HStack {
                Image("meme")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(12)
                    .clipped()
                Spacer()
                VStack(alignment: .leading) {
                    Text("채상윤")
                        .font(.title)
                    Text("SwiftUI를 공부하는 학생입니다.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
//                .frame(maxWidth: .infinity)
                .background(Color.green.opacity(0.3))
                .cornerRadius(12)
            }
            .padding()
            .background(Color.yellow.opacity(0.3))
            .cornerRadius(12)
            
            Spacer()
            
            Text("메시지 보내기")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ProfileCardView()
}
