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
        var myTown = Town()
        myTown.changePopulation(20)
//        myTown.printDescription()
//        let genericMonster = Monster()
//        genericMonster.town = myTown
//        genericMonster.terrorizeTown()
        let fredTheZombie = Zombie()
        fredTheZombie.town = myTown
        fredTheZombie.terrorizeTown()
        fredTheZombie.town?.printDescription()
    }


}

