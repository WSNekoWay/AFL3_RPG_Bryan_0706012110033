//
//  StatusBars.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 01/05/23.
//

import SwiftUI
//this is status bar for player
struct StatusBars: View {
    @EnvironmentObject var player: Player
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text("\(Int(player.health))/\(Int(player.maxHealth))")
                    .font(.custom("PixelOperator-Bold", size: 20))
                    .foregroundColor(.white)
                    .padding(.top,10)
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.trailing, 30)
            }
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(Color.red.opacity(0.3))
                            .frame(width: geometry.size.width, height: 10)
                            .cornerRadius(5)
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: geometry.size.width * CGFloat(player.health) / CGFloat(player.maxHealth), height: 10)
                            .cornerRadius(5)
                    }
                }
                .frame(height: 10)
                .padding(.bottom, 0)
            
            
            HStack {
                Spacer()
                Text("\(Int(player.mana))/\(Int(player.maxMana))")
                    .font(.custom("PixelOperator-Bold", size: 20))                   .foregroundColor(.white)
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.trailing, 30)
            }
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(Color.blue.opacity(0.3))
                            .frame(width: geometry.size.width, height: 10)
                            .cornerRadius(5)
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: geometry.size.width * CGFloat(player.mana) / CGFloat(player.maxMana), height: 10)
                            .cornerRadius(5)
                    }
                }
                .frame(height: 10)
                .padding(.bottom, 10)
            
        }
    }
}

struct StatusBars_Previews: PreviewProvider {
    static var previews: some View {
        StatusBars()
            .environmentObject(Player(name: "WanSen"))
    }
}
