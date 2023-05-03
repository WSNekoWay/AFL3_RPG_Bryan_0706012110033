//
//  BattleView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 30/04/23.
//

import SwiftUI
//this is view for battle view
struct BattleView: View {
    @EnvironmentObject var player: Player
    @Environment(\.presentationMode) var presentationMode
    @Binding var enemyType: String
    @EnvironmentObject var enemyData: EnemyData
    @State private var isShowingWinModal = false
    @State private var isShowingLoseModal = false
    @State private var enemyIndex: Int
    @State private var isShowingConfirmation = false
    @State private var isShowingHome = false
    @State private var isBattle:Bool = true
    @State private var isShowingRestart = false
    init(enemyType: Binding<String>) {
            self._enemyType = enemyType
            _enemyIndex = State(initialValue: enemyType.wrappedValue == "Troll" ? 0 : 1)
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
                            NavigationLink(
                                destination: AttackView(enemyIndex: $enemyIndex, enemyType: $enemyType,isShowingWinModal: $isShowingWinModal,isShowingLoseModal:$isShowingLoseModal)
                                                .environmentObject(player)
                                                .environmentObject(enemyData)
                                                .navigationBarHidden(true)
                            ) {
                                Text("Attack")
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding(.leading,40)
                                    .padding(.bottom, 40)
                                    .padding(.top,40)
                                    .padding(.trailing,40)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8.0)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .onDisappear {
                                DispatchQueue.main.async {
                                    
                                }
                            }



                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                                
                            }) {
                                Text("Escape")
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding(.leading,40)
                                    .padding(.bottom, 40)
                                    .padding(.top,40)
                                    .padding(.trailing,40)
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
                            NavigationLink(destination: ConsumeView(isBattle: $isBattle,enemyType: $enemyType, enemyIndex: $enemyIndex )
                                                .environmentObject(player)
                                                .environmentObject(enemyData)
                                                .navigationBarHidden(true)
                                                .onDisappear {
                                                    DispatchQueue.main.async {
                                                        
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
                                                }) {
                                Text("Consume")
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding(.leading,33)
                                    .padding(.bottom, 40)
                                    .padding(.top,40)
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
                .sheet(isPresented: $isShowingWinModal) {
                    ZStack {
                        Color.black
                            .ignoresSafeArea()
                        VStack {
                            Text("Enemy defeated!")
                                .font(.custom("PixelOperator-Bold", size: 32))
                                .foregroundColor(.white)
                                .padding()
                            Button("Dismiss") {
                                            isShowingWinModal = false
                                            presentationMode.wrappedValue.dismiss()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                presentationMode.wrappedValue.dismiss()
                                            }
                                        }
                            .font(.custom("PixelOperator-Bold", size: 24))
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .padding()
                        }
                    }
                }
                .sheet(isPresented: $isShowingLoseModal) {
                    ZStack {
                        Color.black
                            .ignoresSafeArea()
                        VStack {
                            Text("You have been defeated")
                                .font(.custom("PixelOperator-Bold", size: 32))
                                .foregroundColor(.white)
                                .padding()
                            Button(action: {
                                               self.isShowingHome = true
                            }) {
                                Text("Main Menu")
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding()
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8.0)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .fullScreenCover(isPresented: $isShowingHome) {
                                ContentView()}
                            
                            Button(action: {
                                               self.isShowingRestart = true
                            }) {
                                Text("Restart")
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding()
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8.0)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .fullScreenCover(isPresented: $isShowingRestart) {
                                PrologueView()}
                            
                            Button(action: {
                                
                                self.isShowingConfirmation = true
                            }) {
                                Text("Quit")
                                    .font(.custom("PixelOperator-Bold", size: 24))
                                    .padding()
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8.0)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .alert(isPresented: $isShowingConfirmation) {
                                        Alert(title: Text("Quit confirmation"), message: Text("Are you sure you want to quit?"), primaryButton: .destructive(Text("Quit")) {
                                            exit(0)
                                        }, secondaryButton: .cancel())
                                    }
                            .padding()
                        }
                    }
                }
            }
            
    }
}

struct BattleView_Previews: PreviewProvider {
    static var previews: some View {
        let enemyType = Binding.constant("Golem")
        return BattleView(enemyType: enemyType)
            .environmentObject(Player(name: "WanSen"))
            .environmentObject(EnemyData())
    }
}
