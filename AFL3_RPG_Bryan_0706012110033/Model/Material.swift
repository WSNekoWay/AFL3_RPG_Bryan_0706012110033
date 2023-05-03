//
//  Material.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 30/04/23.
//

import Foundation
import SwiftUI


struct MaterialItem: Equatable,Hashable, Codable,Identifiable, Item {
    var id: Int
    let name: String
    let type: String
    let price: Int
    var owned: Int
    var description: String
    
    private var imageName: String
        var image: Image {
            Image(imageName)
    }
}

