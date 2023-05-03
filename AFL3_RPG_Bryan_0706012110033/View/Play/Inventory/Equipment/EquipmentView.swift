//
//  EquipmentView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is struct for user to see the equipment row list that can be filtered for equipped and can be selected for detail
struct EquipmentView: View {
    @EnvironmentObject var player: Player
    @State private var showEquippedOnly = false
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "PixelOperator", size: 48)!]
        navBarAppearance.barTintColor = UIColor.black
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "PixelOperator", size: 48)!]
        navBarAppearance.tintColor = UIColor.white
    }
    
    var filteredEquipments: [EquipmentItem] {
        player.equipments.filter { equipment in
            (!showEquippedOnly || equipment.equipped)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                List {
                    Toggle(isOn: $showEquippedOnly) {
                        Text("Equipped Only")
                            .foregroundColor(.white)
                            .font(.custom("PixelOperator", size: 24))
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .green))
                    .colorScheme(.dark)
                    .listRowBackground(Color.black)
                    
                    
                    ForEach(filteredEquipments) { equipment in
                        NavigationLink {
                            EquipmentDetail(equipment: equipment)
                        } label: {
                            EquipmentRow(equipment: equipment)
                        }
                    }
                    .listRowBackground(Color.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 1)
                    )
                    .overlay(
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                            .padding(.trailing, 8)
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    )
                }
                .navigationTitle("Equipments")
                .background(Color.black)
                .listStyle(PlainListStyle())
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}


struct EquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentView()
            .environmentObject(Player(name: "WanSen"))
    }
}
