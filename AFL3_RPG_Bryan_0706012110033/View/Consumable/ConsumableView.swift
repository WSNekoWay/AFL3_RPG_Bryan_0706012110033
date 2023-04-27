//
//  ConsumableView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is consumable view that show user consumable row list and user can select it to see detail
struct ConsumableView: View {
    @EnvironmentObject var modelData: ModelData

    var filteredConsumables: [ConsumableItem] {
        modelData.consumables
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredConsumables) { consumable in
                    NavigationLink(destination: ConsumableDetail(consumable: consumable)) {
                        ConsumableRow(consumable: consumable)
                    }
                }
            }
            .navigationTitle("Consumables")
        }
    }
}


struct ConsumableView_Previews: PreviewProvider {
    static var previews: some View {
        ConsumableView()
            .environmentObject(ModelData())
    }
}
