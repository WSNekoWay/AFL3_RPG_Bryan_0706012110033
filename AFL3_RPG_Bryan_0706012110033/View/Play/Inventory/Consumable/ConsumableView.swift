//
//  ConsumableView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is consumable view that show user consumable row list and user can select it to see detail
struct ConsumableView: View {
    @EnvironmentObject var player: Player
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "PixelOperator", size: 48)!]
    }
    var filteredConsumables: [ConsumableItem] {
        player.consumables
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                List {
                    ForEach(filteredConsumables) { consumable in
                        NavigationLink(destination: ConsumableDetail(consumable: consumable)) {
                            ConsumableRow(consumable: consumable)
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



                .navigationTitle("Consumables")
                .background(Color.black)
                .listStyle(PlainListStyle())
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}



struct ConsumableView_Previews: PreviewProvider {
    static var previews: some View {
        ConsumableView()
            .environmentObject(Player(name: "WanSen"))
    }
}
