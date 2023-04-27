//
//  Item.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import Foundation
import SwiftUI

import Foundation
//protocol for item parents
protocol Item {
    var id: Int {get}
    var name: String { get }
    var owned: Int { get set }
    var price: Int { get }
    var description: String { get }
}
