//
//  InventoryView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is inventory view which user can see equipment and consumable user have, but it still has failure when using contentview which is my last checkpoint for this project since I need to learn the mistake
struct InventoryView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Inventory")
                        .font(.custom("PixelOperator-Bold", size: 60))
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    HStack{
                        NavigationLink(destination: EquipmentView()) {
                            VStack {
                                Image("ironsword")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                Text("Equipment")
                                    .font(.custom("PixelOperator", size: 18))
                                    .foregroundColor(.primary)
                                    .padding(.trailing,8)
                                    .padding(.leading,8)
                            }
                            .padding()
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        }
                        NavigationLink(destination: ConsumableView()) {
                            VStack {
                                Image("Potion")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                Text("Consumable")
                                    .font(.custom("PixelOperator", size: 18))
                                    .foregroundColor(.primary)
                                    .padding(.trailing,4)
                                    .padding(.leading,4)
                            }
                            .padding()
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}



struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView()
            .environmentObject(ModelData())
    }
}
