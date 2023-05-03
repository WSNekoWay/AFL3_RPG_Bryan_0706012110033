//
//  Enemy.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 30/04/23.
//

import Foundation
import SwiftUI

final class Enemy: Character, Decodable {
    let type: String
    let imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name, health, maxHealth, type, imageName
    }
    
    init(name: String, health: Int, maxHealth: Int, type: String, imageName: String) {
        self.type = type
        self.imageName = imageName
        do {
            try super.init(name: name, health: health, maxHealth: maxHealth)
        } catch {
            fatalError("Couldn't initialize Enemy: \(error)")
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let health = try container.decode(Int.self, forKey: .health)
        let maxHealth = try container.decode(Int.self, forKey: .maxHealth)
        let type = try container.decode(String.self, forKey: .type)
        let imageName = try container.decode(String.self, forKey: .imageName)
        
        self.type = type
        self.imageName = imageName
        
        do {
            try super.init(name: name, health: health, maxHealth: maxHealth)
        } catch {
            fatalError("Couldn't initialize Enemy: \(error)")
        }
    }
    
    private func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
