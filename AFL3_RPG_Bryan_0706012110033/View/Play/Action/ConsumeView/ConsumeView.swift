//
//  ConsumeView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 30/04/23.
//

import SwiftUI
//this is consume view to redirect player if they want to heal or restore mana
struct ConsumeView: View {
    @EnvironmentObject var player: Player
    @EnvironmentObject var enemyData: EnemyData
    @Environment(\.presentationMode) var presentationMode
    @Binding var isBattle: Bool
    @Binding var enemyType: String
    @Binding var enemyIndex: Int
        var body: some View {
            NavigationView{
            VStack(spacing: 0) {
                
                    ZStack {
                        if isBattle == true{
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
                                .offset(x: -65, y: 50)
                            if enemyType == "Troll"{
                                Image("troll")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .scaleEffect(x: -1, y: 1)
                                    .offset(x: 55, y: 70)
                                EnemyStatusBars(enemyIndex: enemyIndex)
                                    .offset(x: 0, y: -110)
                            }else{
                                Image("golem")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .scaleEffect(x: -1, y: 1)
                                    .offset(x: 55, y: 40)
                                EnemyStatusBars(enemyIndex: enemyIndex)
                                    .offset(x: 0, y: -110)
                                

                            }
                        }else{
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
                    }
                    .frame(height: UIScreen.main.bounds.height / 3)
                    
                    StatusBars()
                    HStack(spacing: 10) {
                        VStack (spacing: 10){
                            NavigationLink(destination: HealView(isBattle: $isBattle,enemyType: $enemyType, enemyIndex: $enemyIndex )
                                .environmentObject(player)
                                .environmentObject(enemyData)
                                .navigationBarHidden(true)) {
                                Text("Heal")
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding(.leading,52)
                                    .padding(.bottom, 40)
                                    .padding(.top,40)
                                    .padding(.trailing,52)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8.0)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }

                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                                
                            }) {
                                Text("Back")
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding(.leading,50)
                                    .padding(.bottom, 40)
                                    .padding(.top,40)
                                    .padding(.trailing,50)
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
                        VStack (spacing: 10){
                            NavigationLink(destination: RestoreView(isBattle: $isBattle,enemyType: $enemyType, enemyIndex: $enemyIndex )
                                .environmentObject(player)
                                .environmentObject(enemyData)
                                .navigationBarHidden(true)) {
                                Text("Restore Mana")
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

struct ConsumeView_Previews: PreviewProvider {
    static var previews: some View {
        let battle = Binding.constant(true)
        let battle1 = Binding.constant("Troll")
        let battle2 = Binding.constant(0)
        ConsumeView(isBattle: battle, enemyType: battle1 ,enemyIndex: battle2 )
            .environmentObject(Player(name: "WanSen"))
            .environmentObject(EnemyData())
    }
}
