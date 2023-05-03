//
//  ModelData.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//
//import Foundation
//import Combine
//
//final class ModelData: ObservableObject {
//    @Published var consumables: [ConsumableItem] = load("consumableData.json")
//    @Published var equipments: [EquipmentItem] = load("equipmentData.json")
//    @Published var materials: [MaterialItem] = load("materialData.json")
//    
//}
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//        
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}
