//
//  FakeTabView.swift
//  TikTokClone
//
//  Created by Max Ward on 28/07/2023.
//

import SwiftUI

struct FakeTabView: View {
    var body: some View {
        HStack {
            
            tabIcon("Home", icon: "home_icon", active: true)
            Spacer()
            tabIcon("Discover", icon: "discover_icon", active: false)
            Spacer()
            
            VStack {
                Image("upload_icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(width: 42)
                .padding(.top, 8)
                Spacer()
            }
            Spacer()
            tabIcon("Inbox", icon: "inbox_icon", active: false)
            Spacer()
            tabIcon("Profile", icon: "profile_icon", active: false, size: 16)
            
        }
        .frame(height: 82)
        .background(Color.black)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func tabIcon(_ text: String, icon: String, active: Bool = true, size: CGFloat = 20) -> some View {
        VStack {
            Image(icon)
                .resizable()
                .foregroundStyle(active ? Color.white : Color("InactiveText"))
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: 24)
            Text(text)
                .font(.system(size: 10))
                .foregroundStyle(active ? Color.white : Color("InactiveText"))
            Spacer()
        }
        .frame(width: 48)
        .padding(.top, 6)
    }
}

#Preview {
    FakeTabView()
}
