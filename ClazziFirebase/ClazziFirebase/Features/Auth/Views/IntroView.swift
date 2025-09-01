//
//  IntroView.swift
//  ClazziFirebase
//
//  Created by 채상윤 on 9/1/25.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            Image("clazzi")
        }
    }
}

#Preview {
    IntroView()
}
