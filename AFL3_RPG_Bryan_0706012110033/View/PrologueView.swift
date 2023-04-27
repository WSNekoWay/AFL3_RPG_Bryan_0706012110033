//
//  PrologueView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is prologue view which will start after user press play and redirect them into playview
struct PrologueView: View {
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all) // set background color to black
                VStack(spacing: 20) {
                    Text("⛩️ Welcome to the New World ! ⛩️")
                        .font(.custom("PixelOperator-Bold", size: 24))
                        .foregroundColor(.white)
                    Text("You have been chosen to embark on an epic journey as a young adventurer on the path to become the greatest adventurer. Your adventures will take you through forests 🌲, mountains 🪨, and dungeons ⛓️, where you will face challenges, make allies, and fight enemies.")
                        .font(.custom("PixelOperator", size: 16))
                        .foregroundColor(.white)
                    Text("Tap anywhere to start")
                        .font(.custom("PixelOperator-Bold", size: 24))
                        .foregroundColor(.white)
                }
                .padding()
                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                .contentShape(Rectangle())
                .onTapGesture {
                    UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: PlayView())
                    UIApplication.shared.windows.first?.makeKeyAndVisible()
                }
            }
        }
    }
}


struct PrologueView_Previews: PreviewProvider {
    static var previews: some View {
        PrologueView()
          
    }
}
