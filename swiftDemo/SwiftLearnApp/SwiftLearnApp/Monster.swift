//
//  Monster.swift
//  SwiftLearnApp
//
//  Created by admin on 2022/8/26.
//

import Foundation

class Monster {
    var town: Town?
    var name = "Monster"
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
