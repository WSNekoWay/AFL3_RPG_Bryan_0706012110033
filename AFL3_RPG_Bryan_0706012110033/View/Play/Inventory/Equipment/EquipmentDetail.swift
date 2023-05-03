//
//  EquipmentDetail.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is equipmint detail
struct EquipmentDetail: View {
    @EnvironmentObject var player: Player
    var equipment: EquipmentItem

    var equipmentIndex: Int {
        player.equipments.firstIndex(where: { $0.id == equipment.id })!
    }

    var filteredEquipment: [EquipmentItem] {
        player.equipments.filter { $0.type == equipment.type }
    }

    func toggleEquip() {

        // Check if the equipment is being equipped
        if player.equipments[equipmentIndex].equipped {
            // Find all equipments of the same type that are not the current equipment, and mark them as not equipped
            player.equipments.indices.filter { index in
                player.equipments[index].type == equipment.type && player.equipments[index].id != equipment.id
            }.forEach { index in
                player.equipments[index].equipped = false
            }
        }
    }


    var body: some View {
        if player.equipments.isEmpty {
            
            Text("No equipment data found.")
                .foregroundColor(.white)
                .font(.custom("PixelOperator", size: 20))
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
                            .font(.custom("PixelOperator", size: 40))
                            .foregroundColor(.white)
                        
                        
                        Spacer()
                        
                        
                    }
                    
                    HStack {
                        Text(equipment.type)
                            .font(.custom("PixelOperator", size: 20))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Owned: \(equipment.owned) x")
                            .font(.custom("PixelOperator", size: 20))
                            .foregroundColor(.gray)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                        .background(Color.gray)


                    
                    Text("About \(equipment.name)")
                        .font(.custom("PixelOperator", size: 28))
                        .foregroundColor(.white)
                    Text(equipment.description)
                        .padding(.bottom,10)
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.white)
                    Text("Damage: \(equipment.damage)")
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.white)
                    
                    Text("Price: \(equipment.price)")
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.white)
                    
                    HStack {
                        Spacer()
                        if equipment.owned == 0 {
                            Text("Not Owned")
                                .font(.custom("PixelOperator", size: 20))
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color.gray)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                            
                        } else {
                        Button(action: toggleEquip) {
                            
                                    
                                
                            
                                EquipButton(isSet: $player.equipments[equipmentIndex].equipped, action: toggleEquip)
                                    .padding(.top, 4)
                            }
                        }

                        Spacer()
                    }

                    
                    
                }
                .padding()
            }
            .navigationTitle(equipment.name)
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.black)
            .foregroundColor(.white)
        }
        
    }
}



struct EquipmentDetail_Previews: PreviewProvider {
    static let player = Player(name: "WanSen")

    static var previews: some View {
        EquipmentDetail(equipment: player.equipments[0])
                .environmentObject(player)
    }
}
