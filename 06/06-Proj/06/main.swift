//
//  main.swift
//  06
//
//  Created by Andras Somlai on 2018. 04. 05..
//  Copyright © 2018. IT Academy. All rights reserved.
//
import Foundation


let family = Helper.createFamily()

let geza = family[0]
let marika = family[1]
let tamas = family[2]
let bianka = family[3]

for human in family {
    debugPrint("Mood: \(human.mood), money:\(human.money), home:\(human.home), moneyForCoffee:\(human.moneyForCoffee), name:\(human.name) id:\(human.id), mother:\(human.mother), father:\(human.father)")
}

let dreamHome : Home = Home()
dreamHome.address = "Hármashatárhegy, Völgy utca 12"
for human in family {
    dreamHome.newPersonMovedToHere(person: human)
}

geza.drinkCoffeeAtHome(taste: .normal, size: .large)
geza.printPersonData()
geza.buyCoffeeMakerForHome()
dreamHome.printFamilyData()
geza.drinkCoffeeAtHome(taste: .normal, size: .extraLarge)
bianka.fillWaterToCoffeeMachine()

geza.drinkCoffeeAtHome(taste: .normal, size: .large)
dreamHome.coffeeMaker!.printCoffeeMakerDetails()

bianka.drinkCoffeeAtHome(taste: .caramel, size: .small)

tamas.drinkCoffeeAtHome(taste: .caramel, size: .small)

dreamHome.printCapsuleData()
tamas.buyCoffeeForHome(capsuleData: [.caramel: 2, .normal:1])
dreamHome.printCapsuleData()

tamas.drinkCoffeeAtHome(taste: .caramel, size: .small)
dreamHome.printCapsuleData()
geza.drinkCoffeeAtHome(taste: .caramel, size: .large)
geza.drinkCoffeeAtHome(taste: .caramel, size: .large)
dreamHome.printFamilyData()

