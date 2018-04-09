//
//  Helper.swift
//  06
//
//  Created by Andras Somlai on 2018. 04. 05..
//  Copyright © 2018. IT Academy. All rights reserved.
//

import Cocoa

class Helper: NSObject {
    static let currentYear = 2018
    static var numberOfPeopleCreated = 0
    private static var usedIds : Set<Int> = Set()
    
//    private override init() {
//        super.init()
//    }
    
    static func createFamily() -> [Human] {
        let dad = Programmer(gender: .male, name: "Géza")
        dad.age = 45
        let mom = Human(gender: .female, name: "Marika")
        mom.age = 39
        let son = Child(gender: .male, name: "Tamás")
        son.age = 10
        let daughter = Child(gender: .female, name: "Bianka")
        daughter.age = 8
        
        son.setParents(mother: mom, father: dad)
        daughter.setParents(mother: mom, father: dad)
        
        return [dad, mom, son, daughter]
    }
    
    static func getNewValidId() -> Int {
        if(usedIds.count == 100000) {
            debugPrint("!!cant generate more unique id!!")
            return 0
        }
        var random = Int(arc4random_uniform(100000))
        while usedIds.contains(random) {
            random = Int(arc4random_uniform(100000))
        }
        usedIds.insert(random)
        return random
    }
    
    static func getSumPriceOfCapsules(data : [CoffeeTaste : Int]) -> Double {
        var sumPrice : Double = 0
        for (taste, quantity) in data {
            let priceOfThatTasteOfCapsule = Capsule.prices[taste]! * Double(quantity)
            sumPrice += priceOfThatTasteOfCapsule
        }
        return sumPrice
    }
    
    static func getCapsulesFrom(data : [CoffeeTaste : Int]) -> [Capsule] {
        var capsules : [Capsule] = []
        for (taste, quantity) in data {
            for _ in stride(from: 0, to: quantity, by: 1) {
                let newCapsule = Capsule()
                newCapsule.taste = taste
                capsules.append(newCapsule)
            }
        }
        return capsules
    }
}
