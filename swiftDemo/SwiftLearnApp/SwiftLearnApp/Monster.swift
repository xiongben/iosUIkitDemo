//
//  Monster.swift
//  SwiftLearnApp
//
//  Created by admin on 2022/8/26.
//

import Foundation

class Monster {
    static let isTerrifying = true
    var town: Town?
    var name: String
    
    init(town: Town?, monsterName: String) {
        self.town = town
        name = monsterName
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
    
    class var spookyNoise: String {
        return "Grrrr"
    }
}
