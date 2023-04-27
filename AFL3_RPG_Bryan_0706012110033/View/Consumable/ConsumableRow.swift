//
//  ItemDetail.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is potion row
struct ConsumableRow: View {
    var consumable: ConsumableItem

    var body: some View {
        HStack {
            consumable.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(consumable.name)
                    .bold()
                Text(consumable.type)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

        }
        .padding(.vertical, 4)
    }
}

struct ConsumableRow_Previews: PreviewProvider {
    static var consumables = ModelData().consumables

    static var previews: some View {
        Group {
            ConsumableRow(consumable: consumables[0])
            ConsumableRow(consumable: consumables[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
