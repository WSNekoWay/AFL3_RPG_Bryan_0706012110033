//
//  ItemRow.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is consumable detail
struct ConsumableDetail: View {
    @EnvironmentObject var player: Player
    var consumable: ConsumableItem

    var consumableIndex: Int {
        player.consumables.firstIndex(where: { $0.id == consumable.id })!
    }

    var filteredConsumable: [ConsumableItem] {
        player.consumables.filter { $0.type == consumable.type }
    }

    var body: some View {
        ScrollView {
            Image("background")
                .resizable()
                .ignoresSafeArea(edges: .top)
                .frame(height: 250)

            CircleImage(image: consumable.image)
                .offset(y: -200)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(consumable.name)
                        .font(.custom("PixelOperator", size: 40))
                        .foregroundColor(.white)

                }

                HStack {
                    Text(consumable.type)
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("Owned: \(consumable.owned) x")
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.gray)
                }
                .font(.subheadline)

                Divider()
                    .background(Color.gray)

                Text("About \(consumable.name)")
                    .font(.custom("PixelOperator", size: 28))
                    .foregroundColor(.white)
                Text(consumable.description)
                    .padding(.bottom,10)
                    .font(.custom("PixelOperator", size: 20))
                    .foregroundColor(.white)
                Text("Value Added : \(consumable.value)")
                    .font(.custom("PixelOperator", size: 20))
                    .foregroundColor(.white)
                Text("Price: \(consumable.price)")
                    .font(.custom("PixelOperator", size: 20))
                    .foregroundColor(.white)
            }
            .padding()
        }
        .navigationTitle(consumable.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.black)
    }
}

struct ConsumableDetail_Previews: PreviewProvider {
    static let player = Player(name: "WanSen")

    static var previews: some View {
        ConsumableDetail(consumable: player.consumables[0])
                .environmentObject(player)
    }
}
