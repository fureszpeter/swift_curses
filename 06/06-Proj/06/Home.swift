//
//  Home.swift
//  06
//
//  Created by Andras Somlai on 2018. 04. 05..
//  Copyright © 2018. IT Academy. All rights reserved.
//

import Cocoa

class Home {
    var coffeeMaker : CoffeeMaker? {
        willSet {
            if(coffeeMaker != nil && newValue != nil) {
                debugPrint("A régi kávéfőzőt újra cserélték")
            }
        }
        didSet {
            if(coffeeMaker == nil) {
                for human in people {
                    human.mood = .sad
                }
            }
            else {
                for human in people {
                    human.mood = .happy
                }
                //Kávégéphez adnak 20 ingyen kapszulást
                for _ in stride(from: 0, to: 20, by: 1) {
                    capsules.append(Capsule())
                }
            }
        }
    }
    
    var address : String = "ismeretlen"
    var water : Water = Water()
    var power : Power = Power()
    var availableWater : Double = 200
    var people : [Human] = []
    var capsules : [Capsule] = []
    

    // A Home osztályba írjátok meg a coffeeParty függvényt, ami addig főzi a kávét, amíg van elég víz és áram a lakásban. Amint valamelyik kifogyott, írja ki a konzolra, hogy mi fogyott el
    func coffeeParty() {
        if(coffeeMaker == nil) {
            debugPrint("Kávégép nélkül nem lehet kávét főzni")
            return
        }
        var numberOfCookedCoffees = 0
        while (true) {
            let coffeeCapsule = Capsule() //Feltétlezem, hogy végtelen számú kávékapszula áll rendelkezésre
            let coffee = coffeeMaker?.makeCoffee(power: self.power, capsule: coffeeCapsule, size: .large)
            
            
            if(coffee == nil) {
                if(power.availablePower < coffeeMaker!.powerConsumption) {
                    break
                }
                else if(availableWater == 0) {
                    debugPrint("Elfogyott a lakásból a víz")
                    break
                }
                else {
                    let waterInCoffeeMaker = coffeeMaker!.waterLevel
                    let requiredWaterToFullFillTank = coffeeMaker!.waterTankSize - waterInCoffeeMaker
                    let filledWater = min(requiredWaterToFullFillTank, availableWater)

                    coffeeMaker!.fillWaterTank(filledWaterQuantity: filledWater, filledWater: self.water)
                    availableWater -= filledWater
                    debugPrint("feltöltöttem a kávégépet \(filledWater) liter vízzel")
                }
                
            }
            numberOfCookedCoffees += 1
            print("Lefőzött kávék száma:\(numberOfCookedCoffees). Még ennyi víz van a lakásban: \(availableWater). Még ennyi áram van a lakásban:\(self.power.availablePower). Ennyi víz a kávégépben:\(coffeeMaker!.waterLevel)")
        }
    }
    
    func newPersonMovedToHere(person : Human) {
        people.append(person)
        person.home = self
        debugPrint("\(person.name) új lakcíme: \(self.address)")
    }
    
    
    
    func getDemographyStatisctics() -> [String : [String : Double]] {
//        example return value:
//        1 család lakik a házban, apuka programozó, felesége nem programozó, és van 2 lányuk
//        ["gender" : ["male" : 0.25, "female" : 0.75, "unknown" : 0], "job" : ["programmer" : 0.25, "child" : 0.5, "unknown" : 0.25]]
        
        var numberOfMales = 0
        var numberOfFemales = 0
        var numberOfPeopleWithUnknownGender = 0
        
        var numberOfChildren = 0
        var numberOfProgrammers = 0
        var numberOfPeopleWithUnknownJob = 0
        for human in people {
            switch human.gender {
            case .male: numberOfMales += 1
            case .female: numberOfFemales += 1
            case .unknown: numberOfPeopleWithUnknownGender += 1
            }
            
            if(human is Programmer) {
                numberOfProgrammers += 1
            }
            else if(human is Child) {
                numberOfChildren += 1
            }
            else {
                numberOfPeopleWithUnknownJob += 1
            }
        }
        
        return  ["gender" : ["male" : Double(numberOfMales)/Double(people.count),
                             "female" :  Double(numberOfFemales)/Double(people.count),
                             "unknown" : Double(numberOfPeopleWithUnknownGender)/Double(people.count)],
                 "job" : ["programmer" :  Double(numberOfProgrammers)/Double(people.count),
                          "child" :  Double(numberOfChildren)/Double(people.count),
                          "unknown" :  Double(numberOfPeopleWithUnknownJob)/Double(people.count)]]
    }
    
    func getCapsule(taste : CoffeeTaste) -> Capsule? {
        for capsule in capsules {
            if(capsule.taste == taste && capsule.isUsed == false) {
                return capsule
            }
        }
        debugPrint("Nincs \(taste.rawValue) ízű kapszula")
        return nil
    }
    
    func throwOutUsedCapsules() {
        var notUsedCapsules : [Capsule] = []
        for capsule in capsules {
            if(capsule.isUsed == false) {
                notUsedCapsules.append(capsule)
            }
        }
        self.capsules.removeAll()
        self.capsules.append(contentsOf: notUsedCapsules)
    }
    
    func addNewCapcules(capsulesToAdd : [Capsule]) {
        var newCapsuleTastes : Set<CoffeeTaste> = Set()
        for capsule in capsulesToAdd {
            newCapsuleTastes.insert(capsule.taste)
        }
        for human in people {
            if(newCapsuleTastes.contains(human.favouriteCoffeeTaste) == true) {
                human.mood = .happy
            }
            else {
                human.mood = .angry
            }
        }
        
        self.capsules.append(contentsOf: capsulesToAdd)
    }
    
    func printFamilyData() {
        for human in people {
            debugPrint("Lakó neve: \(human.name)  --  Lakó Id-je:\(human.id)  --  Lakó kedve:\(human.mood.rawValue)  --  Lakó pénze:\(human.money)  --  Lakó kávépénze:\(human.moneyForCoffee)  --  Lakó anyja neve:\(human.mother?.name)  --  Lakó apja neve:\(human.father?.name)")
        }
    }
    
    func printCapsuleData() {
        var usedCapsules = 0
        for capsule in capsules {
            if (capsule.isUsed == true) {
                usedCapsules += 1
            }
        }
        debugPrint("A lakásban \(capsules.count) kapszula van, ebből \(usedCapsules) használt")
    }
}
