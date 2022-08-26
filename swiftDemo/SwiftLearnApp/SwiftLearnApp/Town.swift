//
//  Town.swift
//  SwiftLearnApp
//
//  Created by admin on 2022/8/26.
//

import Foundation

struct Town {
    var population = 5442
    var numberOfStoplights = 4
    
    func printDescription() {
        print("Population: \(population); number of stoplights: \(numberOfStoplights)")
    }
    
    mutating func changePopulation(_ amount: Int) {
        population += amount
    }
}
