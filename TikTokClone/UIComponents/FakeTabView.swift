//
//  FakeTabView.swift
//  TikTokClone
//
//  Created by Max Ward on 28/07/2023.
//

import SwiftUI

struct FakeTabView: View {
    var body: some View {
        HStack (spacing: 40) {
            
            tabIcon("Home", icon: "home_icon")
            tabIcon("Discover", icon: "discover_icon")
            
            Image("upload_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 55)
                
            
            tabIcon("Inbox", icon: "inbox_icon")
            tabIcon("Profile", icon: "profile_icon")
            
        }
        .background(Color.black)
        .frame(height: 80)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func tabIcon(_ text: String, icon: String) -> some View {
        VStack {
            Image(icon)
                .resizable()
                .foregroundStyle(Color.white)
                .scaledToFit()
                .frame(width: 20, height: 20)
            Text(text)
                .font(.system(size: 11))
                .foregroundStyle(Color.white)
        }
        
    }
}

#Preview {
    FakeTabView()
}
