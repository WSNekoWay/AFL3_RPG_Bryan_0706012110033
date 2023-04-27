//
//  ItemRow.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is consumable detail
struct ConsumableDetail: View {
    @EnvironmentObject var modelData: ModelData
    var consumable: ConsumableItem

    var consumableIndex: Int {
        modelData.consumables.firstIndex(where: { $0.id == consumable.id })!
    }

    var filteredConsumable: [ConsumableItem] {
        modelData.consumables.filter { $0.type == consumable.type }
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
                        .font(.title)


                }

                HStack {
                    Text(consumable.type)
                    Spacer()
                    Text("Owned: \(consumable.owned) x")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(consumable.name)")
                    .font(.title2)
                Text(consumable.description)
                    .padding(.bottom,10)
                Text("Value Added: \(consumable.value)")

                Text("Price: \(consumable.price)")

            }
            .padding()
        }
        .navigationTitle(consumable.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}



struct ConsumableDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        ConsumableDetail(consumable: modelData.consumables[0])
                .environmentObject(modelData)
    }
}
