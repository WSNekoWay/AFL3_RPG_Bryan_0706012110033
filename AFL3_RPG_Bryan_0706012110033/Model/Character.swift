//
//  Character.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 30/04/23.
//

import Foundation


class Character {
    var name: String
    var health: Int
    var maxHealth: Int
    
    init(name: String, health: Int, maxHealth: Int) throws {
        self.name = name
        self.health = health
        self.maxHealth = maxHealth
    }

}

