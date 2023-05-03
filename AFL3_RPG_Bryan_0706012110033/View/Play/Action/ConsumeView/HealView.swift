//
//  HealView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 01/05/23.
//

import SwiftUI
//this is heal view for player to heal themself
struct HealView: View {
    @EnvironmentObject var player: Player
    @EnvironmentObject var enemyData: EnemyData
    @Environment(\.presentationMode) var presentationMode
    @Binding var isBattle: Bool
    @Binding var enemyType: String
    @Binding var enemyIndex: Int
    @State private var showConfirmationDialog = false
    @State private var selectedPotionIndex = 0
    
    @State var showToast = false
    
    private var confirmationMessage: String {
        "You will use 1 \(player.consumables[selectedPotionIndex].name) to heal \(player.consumables[selectedPotionIndex].value) health points. Are you sure you want to use it?"
    }
    
    private func usePotion() {
        player.health += 20
        if player.health > player.maxHealth {
            player.health = player.maxHealth
        }
        player.consumables[selectedPotionIndex].owned -= 1
        if player.consumables[selectedPotionIndex].owned == 0 {
            
            showToast = true
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
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
                            
                            ForEach(Array(player.consumables.enumerated()), id: \.offset) { index, consumable in
                                if consumable.name == "Potion" {
                                    VStack {
                                        Button(action: {
                                            if player.consumables[selectedPotionIndex].owned > 0 {
                                                selectedPotionIndex = index
                                                showConfirmationDialog = true
                                            }
                                        }) {
                                            Text("""
                                                               \(consumable.name)
                                                               x\(consumable.owned)
                                                               """)
                                            .font(.custom("PixelOperator-Bold", size: 24))
                                            .padding(.leading,38)
                                            .padding(.bottom, 28)
                                            .padding(.top,28)
                                            .padding(.trailing,38)
                                            .background(Color.black)
                                            .foregroundColor(.white)
                                            .cornerRadius(8.0)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8.0)
                                                    .stroke(Color.white, lineWidth: 2)
                                            )
                                        }
                                        .disabled(consumable.owned == 0)
                                        Spacer()
                                    }
                                }
                            }
                        }
                        
                        VStack (spacing: 10){
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
                    }
                    .padding()
                }
                .alert(isPresented: $showConfirmationDialog) {
                    Alert(
                        title: Text("Use Potion"),
                        message: Text(confirmationMessage),
                        primaryButton: .default(Text("Yes")) {
                            usePotion()
                        },
                        secondaryButton: .cancel(Text("No"))
                    )
                }
                
                
                ZStack {
                    Spacer()
                    
                    Toast(isPresented: $showToast) {
                        Text("You have used all your potion")
                    }
                    
                    Spacer()
                }
                .zIndex(1)
            }
            .accentColor(.white)
        }
        
    }
}




struct HealView_Previews: PreviewProvider {
    static var previews: some View {
        let battle = Binding.constant(true)
        let battle1 = Binding.constant("Troll")
        let battle2 = Binding.constant(0)
        HealView(isBattle: battle, enemyType: battle1 ,enemyIndex: battle2 )
            .environmentObject(Player(name: "WanSen"))
            .environmentObject(EnemyData())
    }
}
