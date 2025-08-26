//
//  BluetoothView.swift
//  Settings
//
//  Created by 채상윤 on 8/26/25.
//

import SwiftUI

struct WifiView: View {
    @State private var isOn = false
    @State private var isSearching = true
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("Wi-Fi")
                        Spacer()
                        Toggle("On", isOn: $isOn)
                            .labelsHidden()
                    }
                    HStack {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.blue)
                        Text("rapa_classroom-5")
                        Spacer()
                        Image(systemName: "lock.fill")
                            .foregroundStyle(.black)
                        Image(systemName: "wifi")
                            .foregroundStyle(.black)
                    }
                }
                
                Section(header: Text("나의 네트워크")) {
                    HStack {
                        Text("rapa_classroom-6")
                        Spacer()
                        Image(systemName: "lock.fill")
                            .foregroundStyle(.black)
                        Image(systemName: "wifi")
                            .foregroundStyle(.black)
                    }
                    HStack {
                        Text("rapa_classroom-7")
                        Spacer()
                        Image(systemName: "lock.fill")
                            .foregroundStyle(.black)
                        Image(systemName: "wifi")
                            .foregroundStyle(.black)
                    }
                }
                
                Section(header: HStack {
                    Text("다른 네크워크")
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
                    Text("기타...")
                }
            }
            .navigationBarTitle("Wi-Fi")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    WifiView()
}
