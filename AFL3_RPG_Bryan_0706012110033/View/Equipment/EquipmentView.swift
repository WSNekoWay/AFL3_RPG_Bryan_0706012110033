//
//  EquipmentView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is struct for user to see the equipment row list that can be filtered for equipped and can be selected for detail
struct EquipmentView: View {
    @EnvironmentObject var modelData: ModelData
        @State private var showEquippedOnly = false

        var filteredEquipments: [EquipmentItem] {
            modelData.equipments.filter { equipment in
                (!showEquippedOnly || equipment.equipped)
            }
        }

        var body: some View {
            NavigationView {
                if modelData.equipments.isEmpty {
                    
                    Text("No equipment data found.")
                } else {
                    List {
                        Toggle(isOn: $showEquippedOnly) {
                            Text("Equipped Only")
                        }
                        
                        ForEach(filteredEquipments) { equipment in
                            NavigationLink {
                                EquipmentDetail(equipment: equipment)
                            } label: {
                                EquipmentRow(equipment: equipment)
                            }
                        }
                    }
                    .navigationTitle("Equipments")
                }
                
            }
        }
}

struct EquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentView()
            .environmentObject(ModelData())
    }
}
