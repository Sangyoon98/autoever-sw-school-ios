//
//  BluetoothView.swift
//  Settings
//
//  Created by 채상윤 on 8/26/25.
//

import SwiftUI

struct BluetoothView: View {
    @State private var isOn = false
    @State private var isSearching = true
    
    var body: some View {
        NavigationStack {
            List {
                Section(footer: Text("이 iPhone은 Bluetooth 설정이 열려 있는 동안 '채상윤의 iPhone 15 Pro Max'(으)로 인식 가능합니다.")) {
                    HStack {
                        Text("Bluetooth")
                        Spacer()
                        Toggle("On", isOn: $isOn)
                            .labelsHidden()
                    }
                }
                
                Section(header: Text("나의 기기")) {
                    HStack {
                        Text("채상윤의 Apple Watch")
                        Spacer()
                        Text("연결됨")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Image(systemName: "info.circle")
                            .foregroundStyle(.blue)
                    }
                    HStack {
                        Text("Veloster")
                        Spacer()
                        Text("연결 안 됨")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Image(systemName: "info.circle")
                            .foregroundStyle(.blue)
                    }
                    HStack {
                        Text("상윤의 AirPods Pro")
                        Spacer()
                        Text("연결 안 됨")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Image(systemName: "info.circle")
                            .foregroundStyle(.blue)
                    }
                }
                
                Section(header: HStack {
                    Text("다른 기기")
                    if isSearching {
                        ProgressView()
                            .onTapGesture {
                                isSearching.toggle()
                            }
                    }
                }) {
                    Text("DESKTOP-095LHMR")
                    Text("DESKTOP-095LHMR")
                    Text("DESKTOP-095LHMR")
                    Text("DESKTOP-095LHMR")
                    Text("DESKTOP-095LHMR")
                    Text("DESKTOP-095LHMR")
                    Text("DESKTOP-095LHMR")
                }
            }
            .navigationBarTitle("Bluetooth")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    BluetoothView()
}
