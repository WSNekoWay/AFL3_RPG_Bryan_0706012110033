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
        ZStack {
            Rectangle()
                .fill(Color.black)

            HStack {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 50, height: 50)
                    consumable.image
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(.trailing, 8)

                VStack(alignment: .leading) {
                    Text(consumable.name)
                        .font(.custom("PixelOperator", size: 24))
                        .bold()
                        .foregroundColor(.white)
                    Text(consumable.type)
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.gray)
                }

                Spacer()

                
            }
            .padding(.vertical, 4)
            .padding(.horizontal)
        }
    }
}

struct ConsumableRow_Previews: PreviewProvider {
    static var consumables = Player(name: "WanSen").consumables

    static var previews: some View {
        Group {
            ConsumableRow(consumable: consumables[0])
            ConsumableRow(consumable: consumables[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
