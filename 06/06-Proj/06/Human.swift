//
//  Human.swift
//  06
//
//  Created by Andras Somlai on 2018. 04. 05..
//  Copyright © 2018. IT Academy. All rights reserved.
//

import Cocoa

enum Mood : String {
    case happy = "Boldog"
    case angry = "Mérges"
    case sad = "Szomorú"
    case neutral = "Közömbös"
}

enum Gender : String {
    case male = "Férfi"
    case female = "Nő"
    case unknown = "Ismeretlen"
}

enum PersonalityType {
    case modern
    case oldFashioned
}

class Human {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Ezek a változók logikailag nem képzik részéét a küdnak. csak az access control szemléltetésének eszközei
//    public var publicVar : String = "YO"
//    fileprivate var filePrivateVar : String = "YO"
//    private var privateVar : String = "YO"
//    open var openVar : String = "YO"
//    internal var internalVar : String = "YO"
    //access control properties vége
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    var name : String = "Anonymus"
    var money : Double = 100000
    var gender : Gender = .unknown
    var personalityType : PersonalityType = .oldFashioned
    var id : Int = Helper.getNewValidId()
    var mother : Human?
    var father : Human?
    var home : Home?
    var email : Email?
    var favouriteCoffeeTaste : CoffeeTaste = .normal
    var mood : Mood = .neutral {
        didSet {
            debugPrint("\(self.name) hangulata megváltozott. Új hangulat:\(mood.rawValue)")
        }
    }
    var moneyForCoffee : Double {
        get {
            return Double(money) * 0.1
        }
    }
    var age : Int = 0 {
        didSet {
            yearOfBirth = Helper.currentYear - age
        }
        willSet {
            if(newValue < age) {
                debugPrint("Érdekes, ha valaki megfiatalodott..")
            }
        }
    }
    private var yearOfBirth : Int = Helper.currentYear
    
    init() {
        debugPrint("Új ember objektum lett létrehozva")
    }
    
    init(gender : Gender, name : String) {
        self.gender = gender
        self.name = name
        debugPrint("Új ember objektum lett létrehozva")
    }
    
    func setParents(mother : Human?, father : Human?) {
        if(mother != nil && mother!.gender != .female) {
            debugPrint("Az anya csak nő nemű lehet")
            return
        }
        if(father != nil && father!.gender != .male) {
            debugPrint("Az apa csak férfi lehet")
            return
        }
        self.mother = mother
        self.father = father
    }

    func canDrinkCoffeeAtHome() -> Bool {
        return home != nil && home?.coffeeMaker != nil
    }
    
    func drinkCoffeeAtHome(taste : CoffeeTaste, size : CoffeeSize) {
        if(canDrinkCoffeeAtHome() == false) {
            debugPrint("\(self.name) nem ihat kávét otthon")
            self.mood = .sad
            return
        }
        let capsule = self.home!.getCapsule(taste: taste)
        if(capsule == nil) {
            debugPrint("\(self.name) nem tud \(taste.rawValue) ízű kávét inni otthon")
            self.mood = .angry
            return
        }
        let coffee = self.home!.coffeeMaker!.makeCoffee(power: home!.power, capsule: capsule!, size: size)
        if(coffee == nil) {
            self.mood = .angry
        }
        else {
            self.mood = coffee!.quality! > 5.0 ? .happy : .sad
        }
        
    }
    
    func buyCoffeeForHome(capsuleData : [CoffeeTaste : Int]) {
        if(self.home == nil || self.home!.coffeeMaker == nil) {
            debugPrint("Csak akkor vehet \(self.name) kapszulát, ha van lakása, és kávégépe")
            return
        }
        let priceOfCapsules = Helper.getSumPriceOfCapsules(data: capsuleData)
        if(self.moneyForCoffee < priceOfCapsules) {
            debugPrint("Nincs elég kávéra szánható pénze \(self.name)-nek ezekre a kapszulákra")
            return
        }
        self.money -= priceOfCapsules
        let boughtCapsules = Helper.getCapsulesFrom(data: capsuleData)
        self.home!.throwOutUsedCapsules()
        self.home!.addNewCapcules(capsulesToAdd: boughtCapsules)
        self.mood = .happy
        debugPrint("\(self.name) pénze: \(self.money), kávéra költött:\(priceOfCapsules)")
    }
    
    func buyCoffeeMakerForHome() {
        if(self.home == nil) {
            debugPrint("\(self.name) nem tud kávégépet venni, mert nincs otthona")
            return
        }
        if(self.money < CoffeeMaker.standardCoffeeMakerPrice) {
            debugPrint("\(self.name) nem tud kávégépet venni, mert kevés a pénze")
            return
        }
        self.money -= CoffeeMaker.standardCoffeeMakerPrice
        let coffeeMaker = CoffeeMaker()
        self.home!.coffeeMaker = coffeeMaker
    }
    
    func fillWaterToCoffeeMachine() {
        
        let waterInCoffeeMaker = self.home!.coffeeMaker!.waterLevel
        let requiredWaterToFullFillTank = self.home!.coffeeMaker!.waterTankSize - waterInCoffeeMaker
        let filledWater = min(requiredWaterToFullFillTank, self.home!.availableWater)
        
        self.home!.coffeeMaker!.fillWaterTank(filledWaterQuantity: filledWater, filledWater: self.home!.water)
        self.home!.availableWater -= filledWater
        debugPrint("\(self.name) feltöltötte a kávéfőzőt \(filledWater)liter vízzel. A lakásban \(self.home!.availableWater) liter víz maradt")
    }
    
    func printPersonData() {
        debugPrint("Ember neve: \(name)  --  Id-je:\(id)  --  kedve:\(mood.rawValue)  --  pénze:\(money)  --  kávépénze:\(moneyForCoffee)  --  anyja neve:\(mother?.name)  --  apja neve:\(father?.name)")
    }
}


//class Child : Human {
//    
//    
//    func testAccess() {
//        
//        debugPrint(publicVar)
//        debugPrint(filePrivateVar)
//        debugPrint(privateVar)
//        debugPrint(openVar)
//        debugPrint(internalVar)
//    }
//}


//class RandomClassInSameFile : NSObject {
////    https://useyourloaf.com/blog/swift-4-access-levels/
//    func testAccess() {
//
//        let human = Human()
//        debugPrint(human.publicVar)
//        debugPrint(human.filePrivateVar)
//        debugPrint(human.privateVar)
//        debugPrint(human.openVar)
//        debugPrint(human.internalVar)
//
//        let child = Child()
//        debugPrint(child.publicVar)
//        debugPrint(child.filePrivateVar)
//        debugPrint(child.privateVar)
//        debugPrint(child.openVar)
//        debugPrint(child.internalVar)
//
//    }
//}

