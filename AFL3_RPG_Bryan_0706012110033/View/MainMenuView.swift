//
//  MainMenuView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct MainMenuView: View {
    @State private var isShowingConfirmation = false
    @Binding var isShowSplash: Bool
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
                .animation(.easeOut(duration: 0.5).delay(0.5))
            }
        }
        }
}

