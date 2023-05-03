//
//  MenuView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is menu view when user are playing 
struct MenuView: View {
    @State private var isShowingConfirmation = false
    @State private var isShowingHome = false
    @State private var isShowingRestart = false
    var body: some View {
        NavigationView {
            ZStack{
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    Text("Menu")
                        .font(.custom("PixelOperator-Bold", size: 60))
                        .foregroundColor(.white)
                    
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
                }
                
            }
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
