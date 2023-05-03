//
//  ActionView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is struct for action view and it will be updated in the future
struct ActionView: View {
    @EnvironmentObject var player: Player
    @State private var forestType = "Troll"
    @State private var enemyIndex: Int = 0
    @State private var isBattle = false
    @EnvironmentObject var enemyData: EnemyData
    @State private var mountainType = "Golem"
        var body: some View {
            NavigationView{
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
                    HStack(spacing: 10) {
                        VStack (spacing: 10){
                            NavigationLink(destination: StatusView().environmentObject(player).navigationBarHidden(true)) {
                                Text("Status")
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

                            NavigationLink(destination: BattleView(enemyType: $forestType).environmentObject(player).navigationBarHidden(true)) {
                                Text("Go to Forest")
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding(.leading,46)
                                    .padding(.bottom, 16)
                                    .padding(.top,16)
                                    .padding(.trailing,46)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8.0)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            
                            Spacer()
                        }
                        VStack(spacing: 10) {
                            NavigationLink(destination: ConsumeView(isBattle: $isBattle,enemyType: $forestType, enemyIndex: $enemyIndex)
                                .environmentObject(player)
                                .environmentObject(enemyData)
                                .navigationBarHidden(true)) {
                                Text("Consume")
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding(.leading,33)
                                    .padding(.bottom, 28)
                                    .padding(.top,28)
                                    .padding(.trailing,33)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8.0)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            
                            NavigationLink(destination: BattleView(enemyType: $mountainType).environmentObject(player).navigationBarHidden(true)) {
                                Text("Go to Mountain")
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding(.leading,31)
                                    .padding(.bottom, 16)
                                    .padding(.top,16)
                                    .padding(.trailing,31)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8.0)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            Spacer()
                        }
                        
                    }
                    .padding()
                }
                
                
                .background(Color.black.edgesIgnoringSafeArea(.all))
                .accentColor(.white)
            }
            
    }
}



struct ActionView_Previews: PreviewProvider {
    static var previews: some View {
        ActionView()
            .environmentObject(Player(name: "WanSen"))
            .environmentObject(EnemyData())
    }
}
