//
//  ContentView.swift
//  1Text&Stack
//
//  Created by 채상윤 on 8/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {    // 새로로 자식 뷰들을 배치한다.
            Text("텍스트")
            Text("Placeholder")
                .font(.title)
            VStack {
                Text("Placeholder2")
                    .font(.system(size: 24))
            }
            VStack {
                Text("안녕하세요.")
                    .font(.body)
                    .bold()
                    .italic()
                    .foregroundStyle(.red)
            }
            Text("SwiftUI는\n엄청나게\n쉽습니다.")
                .lineSpacing(10)    // 줄 간격 조절
                .lineLimit(2)   // 최대 2줄까지 표시
            Text("안녕하세요 여러분! 스위프트UI를 배워보겠습니다! 안녕하세요 여러분! 스위프트UI를 배워보겠습니다!")
                .lineLimit(1)
                .truncationMode(.tail)  // 잘릴 떄 "..." 표시 (기본 .tail)
            Text("패딩, 배경, 테두리")
                .padding()
                .background(Color.yellow)
                .cornerRadius(20)
//                .border(Color.blue, width: 3)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue, lineWidth: 3)
                )
            // 원형
            Text("패딩, 배경, 테두리")
                .padding()
                .background(Color.yellow)
                .cornerRadius(20)
//                .border(Color.blue, width: 3)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 3)
                )
            // 캡슐
            Text("패딩, 배경, 테두리")
                .padding()
                .background(Color.yellow)
                .cornerRadius(20)
//                .border(Color.blue, width: 3)
                .clipShape(Capsule())
                .overlay(   // 왼쪽, 오른쪽 또는 위, 아래 둥글게
                    Capsule()
                        .stroke(Color.blue, lineWidth: 3)
                )
            HStack {
                Text("간단한 텍스트")
                Text("간단한 텍스트")
            }
        }
        HStack {}   // 가로로 자식 뷰들을 배치한다.
        ZStack {}   // 중첩으로 자식 뷰들을 배치한다.
    }
}

#Preview {
    ContentView()
}
