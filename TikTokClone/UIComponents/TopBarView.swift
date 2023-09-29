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
                Image("live")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(Color.white)
                    .frame(width: 30)
                    
                
                Spacer()
                HStack(spacing: 16) {
                    Text("Cerca")
                        .foregroundStyle(Color("InactiveText"))
                        .opacity(0.6)
                    Text("Siguiendo")
                        .foregroundStyle(Color("InactiveText"))
                        .opacity(0.6)
                    Text("Para ti")
                }
                .lineSpacing(0.8)
                .foregroundStyle(Color.white)
                .fontWeight(.semibold)
                .font(.system(size: 18))
                
                Spacer()
                Image("discover_icon")
                    .resizable()
                    .foregroundStyle(Color.white)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    
            }
            .padding(.horizontal)
            .padding(.top, 65)
            Spacer()
        }
    }
}

#Preview {
    TopBarView()
}
