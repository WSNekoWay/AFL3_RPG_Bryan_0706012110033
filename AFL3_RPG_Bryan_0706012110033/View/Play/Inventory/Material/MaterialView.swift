//
//  MaterialView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 30/04/23.
//

import SwiftUI
//this is material view that show user material row list and user can select it to see detail
struct MaterialView: View {
    @EnvironmentObject var player: Player
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "PixelOperator", size: 48)!]
    }
    
    var filteredMaterials: [MaterialItem] {
        player.materials
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                List {
                    ForEach(filteredMaterials) { material in
                        NavigationLink(destination: MaterialDetail(material: material)) {
                            MaterialRow(material: material)
                                .overlay(
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                        .padding(.trailing, 8)
                                        .offset(x: 8)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                )
                        }
                        .listRowBackground(Color.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 1)
                        )
                    }
                }



                .navigationTitle("Materials")
                .background(Color.black)
                .listStyle(PlainListStyle())
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}




struct MaterialView_Previews: PreviewProvider {
    static var previews: some View {
        MaterialView()
            .environmentObject(Player(name: "WanSen"))
    }
}
