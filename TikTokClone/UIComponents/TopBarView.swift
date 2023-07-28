//
//  TopBarView.swift
//  TikTokClone
//
//  Created by Max Ward on 28/07/2023.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "play.tv")
                    .foregroundStyle(Color.white)
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
                
                Spacer()
                HStack() {
                    Text("Cerca")
                        .foregroundStyle(Color.white.opacity(0.6))
                    Text("Siguiendo")
                        .foregroundStyle(Color.white.opacity(0.6))
                    Text("Para ti")
                }
                .foregroundStyle(Color.white)
                .fontWeight(.semibold)
                .font(.system(size: 18))
                
                Spacer()
                Image("discover_icon")
                    .resizable()
                    .foregroundStyle(Color.white)
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    
            }
            .padding(.horizontal)
            .padding(.top, 60)
            Spacer()
        }
    }
}

#Preview {
    TopBarView()
}
