//
//  ViewController.swift
//  SwiftLearnApp
//
//  Created by admin on 2022/8/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var myTown = Town(population: 1000, numberOfStoplights: 20, townSize: .small)
        myTown.changePopulation(20)
//        myTown.printDescription()
//        let genericMonster = Monster()
//        genericMonster.town = myTown
//        genericMonster.terrorizeTown()
        let fredTheZombie = Zombie(town: myTown, monsterName: "Fred")
        fredTheZombie.terrorizeTown()
        fredTheZombie.town?.printDescription()
        if Zombie.isTerrifying {
            print("Run away!")
        }
    }


}

