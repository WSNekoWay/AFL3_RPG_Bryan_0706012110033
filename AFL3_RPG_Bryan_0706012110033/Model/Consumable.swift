//
//  Consumable.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import Foundation
import SwiftUI

struct ConsumableItem: Equatable,Hashable, Codable,Identifiable, Item {
    var id: Int
    let name: String
    let type: String
    let effect: String
    let value: Int
    var owned: Int
    let price: Int
    var description: String
    
    private var imageName: String
        var image: Image {
            Image(imageName)
    }
}
