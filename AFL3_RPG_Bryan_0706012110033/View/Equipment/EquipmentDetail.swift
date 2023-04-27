//
//  EquipmentDetail.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is equipmint detail
struct EquipmentDetail: View {
    @EnvironmentObject var modelData: ModelData
    var equipment: EquipmentItem

    var equipmentIndex: Int {
        modelData.equipments.firstIndex(where: { $0.id == equipment.id })!
    }

    var filteredEquipment: [EquipmentItem] {
        modelData.equipments.filter { $0.type == equipment.type }
    }

    func toggleEquip() {

        // Check if the equipment is being equipped
        if modelData.equipments[equipmentIndex].equipped {
            // Find all equipments of the same type that are not the current equipment, and mark them as not equipped
            modelData.equipments.indices.filter { index in
                modelData.equipments[index].type == equipment.type && modelData.equipments[index].id != equipment.id
            }.forEach { index in
                modelData.equipments[index].equipped = false
            }
        }
    }


    var body: some View {
        if modelData.equipments.isEmpty {
            
            Text("No equipment data found.")
        }else{
            ScrollView {
                Image("background")
                    .resizable()
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 250)
                
                CircleImage(image: equipment.image)
                    .offset(y: -200)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(equipment.name)
                            .font(.title)
                        
                        
                        EquipButton(isSet: $modelData.equipments[equipmentIndex].equipped, action: toggleEquip)
                        
                        
                        
                    }
                    
                    HStack {
                        Text(equipment.type)
                        Spacer()
                        Text("Owned: \(equipment.owned) x")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("About \(equipment.name)")
                        .font(.title2)
                    Text(equipment.description)
                        .padding(.bottom,10)
                    Text("Damage: \(equipment.damage)")
                    
                    Text("Price: \(equipment.price)")
                    
                }
                .padding()
            }
            .navigationTitle(equipment.name)
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}



struct EquipmentDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        EquipmentDetail(equipment: modelData.equipments[0])
                .environmentObject(modelData)
    }
}
