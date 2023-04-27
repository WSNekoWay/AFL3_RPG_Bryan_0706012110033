//
//  ActionView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is struct for action view and it will be updated in the future
struct ActionView: View {
    var hp: CGFloat = 30.0
    var maxHp: CGFloat = 100.0
    
    var body: some View {
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
            
            VStack {
                HStack {
                    Spacer()
                    Text("\(Int(hp))/\(Int(maxHp))")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                        .padding(.trailing, 20)
                }
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(Color.red.opacity(0.3))
                            .frame(width: geometry.size.width, height: 10)
                            .cornerRadius(5)
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: geometry.size.width * hp / maxHp, height: 10)
                            .cornerRadius(5)
                    }
                }
                .frame(height: 10)
                .padding(.bottom, 80)
            }
            
            HStack(spacing: 20) {
                VStack {
                    Button(action: {
                        
                    }) {
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
                    Button(action: {
                        
                    }) {
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
                VStack {
                    Button(action: {
                        
                    }) {
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
                    
                    Button(action: {
                        
                    }) {
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


struct ActionView_Previews: PreviewProvider {
    static var previews: some View {
        ActionView()
    }
}
