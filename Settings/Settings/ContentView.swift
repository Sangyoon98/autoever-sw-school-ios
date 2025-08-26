//
//  ContentView.swift
//  Settings
//
//  Created by 채상윤 on 8/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var airPlaneMode: Bool = false
    
    var body: some View {
        NavigationSplitView {
            List {
                ProfileRow(title: "채상윤")
                
                Section {
                    SettingRow(
                        title: "에어플레인 모드",
                        icon: "airplane",
                        iconColor: .orange,
                        hasToggle: true,
                        toggleState: $airPlaneMode
                    )
//                    NavigationLink(destination: WifiView()) {
//                        SettingRow(
//                            title: "Wi-Fi",
//                            subTitle: "rapa_classroom-5",
//                            icon: "wifi",
//                            iconColor: .blue,
//                            destination: AnyView(WifiView())
//                        )
//                    }
                    
                    SettingRow(
                        title: "Bluetooth",
                        subTitle: "켬",
                        icon: "bluetooth",
                        iconColor: .blue,
                        destination: AnyView(BluetoothView())
                    )
                    SettingRow(
                        title: "셀룰러",
                        icon: "antenna.radiowaves.left.and.right",
                        iconColor: .green
                    )
                    SettingRow(
                        title: "개인용 핫스팟",
                        subTitle: "끔",
                        icon: "personalhotspot",
                        iconColor: .green
                    )
                    SettingRow(
                        title: "배터리",
                        icon: "battery.100",
                        iconColor: .green
                    )
                    SettingRow(
                        title: "VPN",
                        subTitle: "연결 안 됨",
                        icon: "lock.shield",
                        iconColor: .blue
                    )
                }
                
                Section {
                    SettingRow(
                        title: "일반",
                        icon: "gearshape",
                        iconColor: .gray
                    )
                    SettingRow(
                        title: "손쉬운 사용",
                        icon: "accessibility",
                        iconColor: .blue
                    )
                    SettingRow(
                        title: "검색",
                        icon: "magnifyingglass",
                        iconColor: .gray
                    )
                    SettingRow(
                        title: "동작 버튼",
                        icon: "circle.circle",
                        iconColor: .blue
                    )
                    SettingRow(
                        title: "디스플레이 및 밝기",
                        icon: "sun.max.fill",
                        iconColor: .blue
                    )
                    SettingRow(
                        title: "배경화면",
                        icon: "photo",
                        iconColor: .blue
                    )
                    SettingRow(
                        title: "스탠바이",
                        icon: "bed.double.fill",
                        iconColor: .black
                    )
                    SettingRow(
                        title: "제어 센터",
                        icon: "switch.2",
                        iconColor: .gray
                    )
                    SettingRow(
                        title: "카메라",
                        icon: "camera.fill",
                        iconColor: .gray
                    )
                    SettingRow(
                        title: "홈 화면 및 앱 보관함",
                        icon: "square.grid.3x3",
                        iconColor: .blue
                    )
                    SettingRow(
                        title: "Apple Intelligence 및 Siri",
                        icon: "sparkles",
                        iconColor: .indigo
                    )
                }
                
                Section {
                    SettingRow(
                        title: "알림",
                        icon: "bell.badge.fill",
                        iconColor: .red
                    )
                    SettingRow(
                        title: "사운드 및 햅틱",
                        icon: "speaker.wave.3.fill",
                        iconColor: .red
                    )
                    SettingRow(
                        title: "집중 모드",
                        icon: "moon.fill",
                        iconColor: .purple
                    )
                    SettingRow(
                        title: "스크린 타임",
                        icon: "hourglass",
                        iconColor: .purple
                    )
                }
                
                Section {
                    SettingRow(
                        title: "Face ID 및 암호",
                        icon: "faceid",
                        iconColor: .green
                    )
                    SettingRow(
                        title: "긴급 구조 요청",
                        icon: "sos",
                        iconColor: .red
                    )
                    SettingRow(
                        title: "개인정보 보호 및 보안",
                        icon: "hand.raised.fill",
                        iconColor: .blue
                    )
                }
                
                Section {
                    SettingRow(
                        title: "지갑 및 Apple Pay",
                        icon: "wallet.pass",
                        iconColor: .green
                    )
                    SettingRow(
                        title: "Game Center",
                        icon: "gamecontroller.fill",
                        iconColor: .green
                    )
                    SettingRow(
                        title: "iCloud",
                        icon: "icloud.fill",
                        iconColor: .blue
                    )
                }
                
                Section {
                    SettingRow(
                        title: "앱",
                        icon: "apps.iphone",
                        iconColor: .purple
                    )
                }
                
                Section {
                    SettingRow(
                        title: "개발자",
                        icon: "hammer.fill",
                        iconColor: .gray
                    )
                }
            }
            .navigationTitle(Text("설정"))
            .searchable(text: $searchText, prompt: "검색")
        } detail: {
            Text("항목을 선택해주세요.")
        }
    }
}

struct ProfileRow: View {
    var title: String
    
    var content: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundStyle(.secondary)
                .padding(.vertical, 4)
                .padding(.trailing, 4)
            VStack(alignment: .leading) {
                Text(title)
                    .bold()
                Text("Apple 계정, iCloud 등")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    var body: some View {
        NavigationLink(destination: Text(title)) {
            content
        }
    }
}

struct SettingRow: View {
    let title: String
    var subTitle: String? = nil
    let icon: String
    let iconColor: Color
    var hasNavigation: Bool = true
    var destination: AnyView? = AnyView(Text("Setting"))
    var hasToggle: Bool = false
    var toggleState: Binding<Bool>? = nil
    
    var content: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 32, height: 32)
                .foregroundStyle(.white)
                .background(iconColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.trailing, 4)
            Text(title)
            Spacer()
            if let subTitle = subTitle {
                Text(subTitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    var body: some View {
        if hasToggle, let toggleState {
            HStack {
                Image(systemName: icon)
                    .frame(width: 32, height: 32)
                    .foregroundStyle(.white)
                    .background(iconColor)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.trailing, 4)
                Text(title)
                Spacer()
                Toggle("", isOn: toggleState)
                    .labelsHidden()
            }
        } else if hasNavigation {
            NavigationLink(destination: destination) {
                content
            }
        } else {
            content
        }
    }
}

#Preview {
    ContentView()
}
