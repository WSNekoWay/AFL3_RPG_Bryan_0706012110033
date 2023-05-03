//
//  AttackView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 03/05/23.
//

import SwiftUI
//this is view for attacking enemy 
struct AttackView: View {
    @EnvironmentObject var player: Player
    @Environment(\.presentationMode) var presentationMode
    @Binding var enemyIndex: Int
    @Binding var enemyType: String
    @State var fatalDamage: Bool = false
    @Binding var isShowingWinModal: Bool
    @Binding var isShowingLoseModal: Bool
    @EnvironmentObject var enemyData: EnemyData
    var totalDamage: Int {
        var damage = 0
        for equipment in player.equipments where equipment.equipped {
            damage += equipment.damage
        }
        return damage
    }
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
                       
                    }
                    .frame(height: UIScreen.main.bounds.height / 3)
                    
                    StatusBars()
                    HStack(spacing: 10) {
                        VStack(spacing: 10){
                            Button(action: {
                                withAnimation {
                                    DispatchQueue.main.async {
                                        
                                                                
                                    if fatalDamage == false {
                                        enemyData.enemies[enemyIndex].health -= (totalDamage+5)
                                    } else {
                                        enemyData.enemies[enemyIndex].health -= (2*(totalDamage+5))
                                    }
                                        enemyData.objectWillChange.send()
                                    if enemyData.enemies[enemyIndex].health <= 0 {
                                            enemyData.enemies[enemyIndex].health = enemyData.enemies[enemyIndex].maxHealth
                                        if enemyData.enemies[enemyIndex].name == "Forest Troll"{
                                            player.materials[0].owned += 1
                                            player.materials[1].owned += 2
                                        }
                                        else if enemyData.enemies[enemyIndex].name == "Mountain Golem"{
                                            player.materials[2].owned += 1
                                            player.materials[3].owned += 5
                                        }
                                            presentationMode.wrappedValue.dismiss()
                                            isShowingWinModal = true}
                                    let shouldGenerateRandomNumber = Int.random(in: 0...9) < 9
                                        if shouldGenerateRandomNumber {
                                            let randomNumber = Int.random(in: 1...15)
                                            player.health -= randomNumber
                                        }
                                    player.objectWillChange.send()
                                        if player.health <= 0 {
                                            enemyData.enemies[enemyIndex].health = enemyData.enemies[enemyIndex].maxHealth
                                            presentationMode.wrappedValue.dismiss()
                                            isShowingLoseModal = true}
                                                                
                                    }
                                    
                                }

                                
                            }) {
                                if fatalDamage == false{
                                    Text("""
                                    Physical Attack
                                    Damage:\(totalDamage+5)
                                    """)
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding(.leading,20)
                                    .padding(.bottom, 20)
                                    .padding(.top,10)
                                    .padding(.trailing,20)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8.0)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                                    
                                }else{
                                    Text("""
                                    Physical Attack
                                    Damage:\((totalDamage+5)*2)
                                    """)
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding(.leading,20)
                                    .padding(.bottom, 20)
                                    .padding(.top,10)
                                    .padding(.trailing,20)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8.0)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                                }
                            }

                            Button(action: {
                                fatalDamage = true
                                DispatchQueue.main.async {
                                    let shouldGenerateRandomNumber = Int.random(in: 0...9) < 9

                                    if shouldGenerateRandomNumber {
                                        let randomNumber = Int.random(in: 1...15)
                                        player.health -= randomNumber
                                    }
                                    player.mana -= 10
                                    player.objectWillChange.send()
                                }
                            }) {
                                Text("Scan")
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
                        VStack(spacing: 10){
                            Button(action: {
                                DispatchQueue.main.async {
                                    if fatalDamage == false{
                                        enemyData.enemies[enemyIndex].health -= (250)
                                    }
                                    else{
                                        enemyData.enemies[enemyIndex].health -= (2*(250))
                                    }
                                    enemyData.objectWillChange.send()
                                    if enemyData.enemies[enemyIndex].health <= 0 {
                                            enemyData.enemies[enemyIndex].health = enemyData.enemies[enemyIndex].maxHealth
                                        if enemyData.enemies[enemyIndex].name == "Forest Troll"{
                                            player.materials[0].owned += 1
                                            player.materials[1].owned += 2
                                        }
                                        else if enemyData.enemies[enemyIndex].name == "Mountain Golem"{
                                            player.materials[2].owned += 1
                                            player.materials[3].owned += 5
                                        }
                                            presentationMode.wrappedValue.dismiss()
                                            isShowingWinModal = true}
                                    let shouldGenerateRandomNumber = Int.random(in: 0...9) < 9

                                    if shouldGenerateRandomNumber {
                                        let randomNumber = Int.random(in: 1...15)
                                        player.health -= randomNumber
                                    }
                                    player.mana -= 10
                                    player.objectWillChange.send()
                                    if player.health <= 0 {
                                        enemyData.enemies[enemyIndex].health = enemyData.enemies[enemyIndex].maxHealth
                                        presentationMode.wrappedValue.dismiss()
                                        isShowingLoseModal = true}
                                }
                                
                            }) {
                                if fatalDamage == false{
                                    Text("""
                                    Fireball
                                    Damage:\(250)
                                    Mana: -10
                                    """)
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding(.leading,20)
                                    .padding(.bottom, 20)
                                    .padding(.top,10)
                                    .padding(.trailing,20)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8.0)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                                    
                                }else{
                                    Text("""
                                    Fireball
                                    Damage:\(250*2)
                                    Mana: -10
                                    """)
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding(.leading,20)
                                    .padding(.bottom, 20)
                                    .padding(.top,10)
                                    .padding(.trailing,20)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8.0)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                                }
                            }
                            .disabled(player.mana < 10)
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                                
                            }) {
                                Text("Back")
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

struct AttackView_Previews: PreviewProvider {
    static var previews: some View {
        let enemyType = Binding.constant("Golem")
        let enemyIndex = Binding.constant(1)
        let show = Binding.constant(false)
        return AttackView(enemyIndex: enemyIndex,enemyType: enemyType, isShowingWinModal: show, isShowingLoseModal: show)
            .environmentObject(Player(name: "WanSen"))
            .environmentObject(EnemyData())
    }
}
