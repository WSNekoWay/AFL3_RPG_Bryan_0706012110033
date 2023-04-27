//
//  EquipmentRow.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is equipment row
struct EquipmentRow: View {
    var equipment: EquipmentItem

    var body: some View {
        
        HStack {
            equipment.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(equipment.name)
                    .bold()
                Text(equipment.type)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            if equipment.equipped {
                Image(systemName: "checkmark.circle.fill")
                    .imageScale(.medium)
                    .foregroundColor(.green)
            }
        }
        .padding(.vertical, 4)
    }
}

struct EquipmentRow_Previews: PreviewProvider {
    static var equipments = ModelData().equipments

    static var previews: some View {
        Group {
            EquipmentRow(equipment: equipments[0])
            EquipmentRow(equipment: equipments[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
