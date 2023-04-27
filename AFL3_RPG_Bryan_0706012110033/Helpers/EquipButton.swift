//
//  EquipButton.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct EquipButton: View {
    @Binding var isSet: Bool
    var action: (() -> Void)?

    var body: some View {
        Button(action: {
            isSet.toggle()
            action?()
        }, label: {
            Label(isSet ? "Equipped" : "Not Equipped", systemImage: isSet ? "checkmark.circle.fill" : "xmark.circle.fill")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .green : .red)
        })
    }
}



struct EquipButton_Previews: PreviewProvider {
    static var previews: some View {
        EquipButton(isSet: .constant(true))
    }
}
