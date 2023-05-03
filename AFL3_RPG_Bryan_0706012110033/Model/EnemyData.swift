//
//  EnemyData.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 30/04/23.
//

import Foundation
  
final class EnemyData: ObservableObject {
    @Published var enemies: [Enemy] = []
    
    init() {
        loadEnemies()
    }
    
    private func loadEnemies() {
        let enemyData: [Enemy] = load("enemyData.json")
        self.enemies = enemyData
    }
    
    private func load<T: Decodable>(_ filename: String) -> T {
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            let data = try Data(contentsOf: file)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
