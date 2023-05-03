//
//  AFL3_RPG_Bryan_0706012110033App.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 26/04/23.
//

import SwiftUI

@main
struct AFL3_RPG_Bryan_0706012110033App: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(EnemyData())
        }
    }
}
