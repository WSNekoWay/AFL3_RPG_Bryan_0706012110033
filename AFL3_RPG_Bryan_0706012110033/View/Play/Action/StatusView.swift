//
//  StatusView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 30/04/23.
//

import SwiftUI
//this is status view to see player status
struct StatusView: View {
    @EnvironmentObject var player: Player
    
    @Environment(\.presentationMode) var presentationMode
       
        var totalDamage: Int {
            var damage = 0
            for equipment in player.equipments where equipment.equipped {
                damage += equipment.damage
            }
            return damage
        }
        var totalOwnedEquipment: Int {
            var count = 0
            for equipment in player.equipments {
                if equipment.owned > 0 {
                    count += 1
                }
            }
            return count
        }
        var totalEquipment: Int {
            player.equipments.count
        }

        

    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                ZStack {
                    GeometryReader { geometry in
                        Image("background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                    }
                    Image("player")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .offset(x: 0, y: 50)
                }
                .frame(height: UIScreen.main.bounds.height / 3)
                
                StatusBars()
                    
                HStack {
                    Text("Adventurer Name:")
                        .font(.custom("PixelOperator-Bold", size: 24))
                        .foregroundColor(.white)
                    Spacer()
                    Text(player.name)
                        .font(.custom("PixelOperator-Bold", size: 24))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 48)
                .padding(.bottom,5)
                Divider()
                    .background(Color.gray)
                
                HStack {
                    Text("Physical Power:")
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(totalDamage)")
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 48)
                .padding(.vertical,5)
                HStack {
                    Text("Magical Power: ")
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.white)
                    Spacer()
                    Text("0")
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 48)
                .padding(.vertical,5)
                
                HStack {
                    Text("Coins: ")
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(player.coin)")
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 48)
                .padding(.vertical,5)
                HStack {
                    Text("Equipments: ")
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(totalOwnedEquipment) / \(totalEquipment)")
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 48)
                .padding(.vertical,5)
                
                
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Back")
                        .font(.custom("PixelOperator-Bold", size: 24))
                        .padding(.leading,48)
                        .padding(.bottom, 28)
                        .padding(.top,28)
                        .padding(.trailing,48)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8.0)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .padding(.top,50)
                
                
                
                
                
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .accentColor(.white)
        }
    }

}


struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
            .environmentObject(Player(name: "WanSen"))
    }
}
