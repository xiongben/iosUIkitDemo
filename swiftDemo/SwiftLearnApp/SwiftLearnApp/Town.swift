//
//  Town.swift
//  SwiftLearnApp
//
//  Created by admin on 2022/8/26.
//

import Foundation

struct Town {
    var population = 5442 {
        didSet(oldPopulation) {
            print("The population has changed to \(population) from \(oldPopulation)")
        }
    }
    var numberOfStoplights = 4
    
    enum Size {
        case small
        case medium
        case large
    }
    
    lazy var townSize: Size =  {
        switch self.population {
        case 0...10000:
            return Size.small
        case 10001...100000:
            return Size.medium
        default:
            return Size.large
        }
    }()
    
    func printDescription() {
        print("Population: \(population); number of stoplights: \(numberOfStoplights)")
    }
    
    mutating func changePopulation(_ amount: Int) {
        population += amount
    }
}
