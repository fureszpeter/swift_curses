//
//  Child.swift
//  06
//
//  Created by Andras Somlai on 2018. 04. 05..
//  Copyright © 2018. IT Academy. All rights reserved.
//

import Foundation

class Child: Human {
    var isCoffeeDrinkingAllowed : Bool {
        get {
            return canDrinkCoffee()
        }
    }
    
    override init() {
        super.init()
        money = 10000
        personalityType = .modern
        favouriteCoffeeTaste = .caramel
        debugPrint("Új gyerek objektum lett létrehozva")
    }
    
    override init(gender : Gender, name : String) {
        super.init(gender: gender, name: name)
        money = 10000
        personalityType = .modern
        favouriteCoffeeTaste = gender == .male ? .caramel : .vanilla
        debugPrint("Új gyerek objektum lett létrehozva")
    }
    
    private func canDrinkCoffee() -> Bool {
        if mother == nil || father == nil {
            return true
        }
        
        let parentPersonalityTypes : (motherType: PersonalityType, fatherType: PersonalityType) = (mother!.personalityType, father!.personalityType)
        switch parentPersonalityTypes {
        case (.modern, .modern): return true
        case (.modern, .oldFashioned): return false
        case (.oldFashioned, .modern): return age >= 10
        case (.oldFashioned, .oldFashioned): return false
        }
    }
    
    override func drinkCoffeeAtHome(taste : CoffeeTaste, size : CoffeeSize) {
        if (isCoffeeDrinkingAllowed == false) {
            mood = .angry
            debugPrint("\(name) nem ihet kávét. A szülei nem engedik")
            return
        }
        else {
            super.drinkCoffeeAtHome(taste : taste, size : size)
        }
    }
}
