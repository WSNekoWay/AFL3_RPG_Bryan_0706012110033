//
//  PlayView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

// this is play view which show what user can do
struct PlayView: View {
    @EnvironmentObject var modelData: Player

    @State private var selection: Tab = .action

    init() {
        let appearance = UITabBar.appearance()
        appearance.barTintColor = .black
        let attributes = [NSAttributedString.Key.font: UIFont(name: "PixelOperator", size: 20)!]
            UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
    }

    enum Tab {
        case action, inventory, menu

        var title: String {
            switch self {
            case .action:
                return "Action"
            case .inventory:
                return "Inventory"
            case .menu:
                return "Menu"
            }
        }

        var image: String {
            switch self {
            case .action:
                return "star"
            case .inventory:
                return "backpack"
            case .menu:
                return "list.bullet"
            }
        }
    }

    var body: some View {
        TabView(selection: $selection) {
            ActionView()
                .tabItem {
                    Label(Tab.action.title, systemImage: Tab.action.image)
                        .foregroundColor(.white)
                        
                }
                .tag(Tab.action)
            InventoryView()
                .tabItem {
                    Label(Tab.inventory.title, systemImage: Tab.inventory.image)
                        .foregroundColor(.white)
                        
                }
                .tag(Tab.inventory)
            MenuView()
                .tabItem {
                    Label(Tab.menu.title, systemImage: Tab.menu.image)
                        .foregroundColor(.white)
                      
                }
                .tag(Tab.menu)
        }
        .accentColor(.yellow)
        
    }
}




struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
            .environmentObject(Player(name: "WanSen"))
            .environmentObject(EnemyData())
    }
}
