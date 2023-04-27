//
//  Equipment.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import Foundation
import SwiftUI


struct EquipmentItem: Equatable,Hashable, Codable,Identifiable, Item {
    var id: Int
    let name: String
    let type: String
    var damage: Int
    let price: Int
    var owned: Int
    var equipped: Bool
    var description: String
    
    private var imageName: String
        var image: Image {
            Image(imageName)
    }
}

