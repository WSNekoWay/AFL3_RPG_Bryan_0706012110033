//
//  SplashScreenView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 26/04/23.
//

import SwiftUI
//this is splash screen
struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("RPG Game")
                    .font(.custom("PixelOperator-Bold", size: 40))
                    .foregroundColor(.white)
                Text("By")
                    .font(.custom("PixelOperator-Bold", size: 40))
                    .foregroundColor(.white)
                Text("WanSen")
                    .font(.custom("PixelOperator-Bold", size: 40))
                    .foregroundColor(.white)
            }
        }
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
