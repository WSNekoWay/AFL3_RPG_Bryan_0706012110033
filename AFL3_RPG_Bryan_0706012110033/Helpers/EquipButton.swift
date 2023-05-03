//
//  EquipButton.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is equipbutton that will be used for equipmentdetail
struct EquipButton: View {
    @Binding var isSet: Bool
    var action: (() -> Void)?

    var body: some View {
        Button(action: {
            isSet.toggle()
            action?()
        }, label: {
            GeometryReader { geometry in
                Text(isSet ? "Unequip" : "Equip")
                    .font(.custom("PixelOperator", size: 20))
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .fixedSize()
                    .background(isSet ? Color.red : Color.green)
                    .cornerRadius(10)
            }
        })
        .frame(width: 100, height: 35, alignment: .center)
    }
}




struct EquipButton_Previews: PreviewProvider {
    static var previews: some View {
        EquipButton(isSet: .constant(true))
    }
}
