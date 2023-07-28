//
//  TextModifiers.swift
//  TikTokClone
//
//  Created by Max Ward on 24/07/2023.
//

import SwiftUI

struct IconText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color("PrimaryText"))
            .fontWeight(.bold)
            .font(.system(size: 12))
    }
}

extension Text {
    func iconFeedTextStyle() -> some View {
        self.modifier(IconText())
    }
}


extension Image {
    func iconFeedStyle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
    }
}
