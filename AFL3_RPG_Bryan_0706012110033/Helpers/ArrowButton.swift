//
//  ArrowButton.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 30/04/23.
//

import SwiftUI

struct WhiteArrowNavigationLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .imageScale(.small)
        }
        .contentShape(Rectangle())
        .padding()
        .background(Color.black)
        .cornerRadius(5)
        .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

