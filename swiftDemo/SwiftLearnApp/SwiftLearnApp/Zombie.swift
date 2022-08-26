//
//  Zombie.swift
//  SwiftLearnApp
//
//  Created by admin on 2022/8/26.
//

import Foundation

class Zombie: Monster {
    var walksWithLimp = true
    
    final override func terrorizeTown() {
        town?.changePopulation(-10)
        super.terrorizeTown()
    }
}
