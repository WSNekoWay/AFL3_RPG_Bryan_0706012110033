//
//  Player.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//


import Foundation
import Combine
//player model data
final class Player: Character, ObservableObject {
    @Published var mana: Int
    @Published var maxMana: Int
    @Published var coin: Int
    @Published var equipments: [EquipmentItem] = []
    @Published var consumables: [ConsumableItem] = []
    @Published var materials: [MaterialItem] = []
    
    init(name: String, health: Int = 100, maxHealth: Int = 100, mana: Int = 50, maxMana: Int = 50, coin: Int = 100) {
        self.mana = mana
        self.maxMana = maxMana
        self.coin = coin
        
        do {
            try super.init(name: name, health: health, maxHealth: maxHealth)
        } catch {
            fatalError("Failed to initialize super class with error: \(error)")
        }
        
        loadEquipment()
        loadConsumables()
        loadMaterials()
    }
    
    func loadEquipment() {
        do {
            let equipmentData: [EquipmentItem] = try load("equipmentData.json")
            self.equipments = equipmentData
        } catch {
            fatalError("Error loading equipment data: \(error)")
        }
    }

    func loadConsumables() {
        do {
            let consumableData: [ConsumableItem] = try load("consumableData.json")
            self.consumables = consumableData
        } catch {
            fatalError("Error loading consumable data: \(error)")
        }
    }

    func loadMaterials() {
        do {
            let materialData: [MaterialItem] = try load("materialData.json")
            self.materials = materialData
        } catch {
            fatalError("Error loading material data: \(error)")
        }
    }

    
    private func load<T: Decodable>(_ filename: String) throws -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            throw NSError(domain: "FileNotFound", code: 404, userInfo: ["filename": filename])
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            throw NSError(domain: "DataLoadError", code: 500, userInfo: ["filename": filename])
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NSError(domain: "DataParseError", code: 500, userInfo: ["filename": filename])
        }
    }
}
