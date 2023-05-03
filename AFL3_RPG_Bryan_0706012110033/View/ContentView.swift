//
//  ContentView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 26/04/23.
//

import SwiftUI

//This is content view to give user splash screen and menu to play and quit which play will bring user into prologueview
struct ContentView: View {
    @State private var showSplash = true
    @State private var isShowingConfirmation = false
    @EnvironmentObject var enemyData: EnemyData
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack{
                        Text("RPG Game")
                            .font(.custom("PixelOperator-Bold", size: 40))
                            .foregroundColor(.white)
                        Text("By")
                            .font(.custom("PixelOperator-Bold", size: 20))
                            .foregroundColor(.white)
                        Text("WanSen")
                            .font(.custom("PixelOperator-Bold", size: 20))
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 20)
                    
                    NavigationLink(destination: PrologueView().navigationBarHidden(true)) {
                        Text("Play")
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
                    .padding(.bottom, 10)
                    
                    Button(action: {
                        self.isShowingConfirmation = true
                    }) {
                        Text("Quit")
                            .font(.custom("PixelOperator-Bold", size: 24))
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8.0)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8.0)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                }
                .alert(isPresented: $isShowingConfirmation) {
                    Alert(title: Text("Quit confirmation"), message: Text("Are you sure you want to quit?"), primaryButton: .destructive(Text("Quit")) {
                        exit(0)
                    }, secondaryButton: .cancel())
                }
                .padding()
                .opacity(showSplash ? 0 : 1)
                .animation(
                    .easeInOut(duration: 0.3)
                    ,value: 1
                )
               
                if showSplash {
                    SplashScreen()
                    .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        showSplash = false
                        }
                        }
                        }
                }
            }
        }
        .accentColor(.white)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EnemyData())
    }
}

