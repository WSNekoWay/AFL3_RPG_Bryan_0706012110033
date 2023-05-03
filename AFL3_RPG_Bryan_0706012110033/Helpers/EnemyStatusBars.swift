//
//  EnemyStatusBars.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 02/05/23.
//

import SwiftUI
//this is enemy status bar
struct EnemyStatusBars: View {
    @EnvironmentObject var enemyData: EnemyData
    var enemyIndex: Int
    
    var body: some View {
        VStack {
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color.red.opacity(0.3))
                        .frame(width: geometry.size.width, height: 10)
                        .cornerRadius(5)
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: geometry.size.width * CGFloat(enemyData.enemies[enemyIndex].health) / CGFloat(enemyData.enemies[enemyIndex].maxHealth), height: 10)
                        .cornerRadius(5)
                }
            }
            
            .frame(height: 10)
            .padding(.bottom, 0)
            HStack{
                Text("\(enemyData.enemies[enemyIndex].name)")
                    .font(.custom("PixelOperator-Bold", size: 20))
                    .foregroundColor(.white)
                    .padding(.top,10)
                    
                    .cornerRadius(10)
                    .padding(.leading, 5)
                Spacer()
                Text("\(Int(enemyData.enemies[enemyIndex].health))/\(Int(enemyData.enemies[enemyIndex].maxHealth))")
                    .font(.custom("PixelOperator-Bold", size: 20))
                    .foregroundColor(.white)
                    .padding(.top,10)
                    
                    .cornerRadius(10)
                    .padding(.trailing, 5)
            }
        }
    }
}


struct EnemyStatusBars_Previews: PreviewProvider {
    static var previews: some View {
        EnemyStatusBars(enemyIndex: 0)
            .environmentObject(EnemyData())
           
    }
}

