//
//  CoffeeMachine.swift
//  06
//
//  Created by Andras Somlai on 2018. 04. 05..
//  Copyright © 2018. IT Academy. All rights reserved.
//

import Cocoa

class CoffeeMaker {
    static let standardCoffeeMakerPrice : Double = 15000
    var producerName : String
    var waterTankSize : Double
    var color : String
    var powerConsumption : Double
    var waterLevel : Double = 0
    var water : Water?
    var availableCoffeeSizes : [CoffeeSize] = [.small, .large]
    
    
    init() {
        producerName = "CoffeMaker CO"
        waterTankSize = 1.5
        color = "black"
        powerConsumption = 220.0
    }
    
    init(factoryName : String) {
        producerName = factoryName
        waterTankSize = 1.5
        color = "black"
        powerConsumption = 220.0
    }
    
    init(factoryName : String, waterTank : Double, machineColor : String, consumptionOfPower : Double) {
        producerName = factoryName
        waterTankSize = waterTank
        color = machineColor
        powerConsumption = consumptionOfPower
    }
    
    func makeCoffee(power : Power, capsule : Capsule, size : CoffeeSize) -> Coffee? {
        if (power.availablePower < powerConsumption) {
            debugPrint("Nincs elegendő energia a kávéfőzéshez")
            return nil
        }
        
        if(water == nil) {
            debugPrint("Nincs víz a kávéfőzőben")
            return nil
        }
        if(waterLevel < Coffee.coffeeAmountFor(size: size)) {
            debugPrint("Nem sikerült kávét főzni. Nincs elég víz a tartályban. Töltsd újra!")
            return nil
        }
        
        
        if (capsule.isUsed == true) {
            debugPrint("Használt kapszulából nem lehet kávét főzni")
            return nil
        }
        
        if(availableCoffeeSizes.contains(size) == false) {
            debugPrint("A gép csak\(getAvailableCoffeeSizesAsString()) méretű kávékat tud főzni")
            return nil
        }
        
        let coffee = Coffee(machine: self, water: water!, capsule: capsule)
        coffee.amount = Coffee.coffeeAmountFor(size: size)
        
        waterLevel -= coffee.amount!
        
        power.availablePower -= powerConsumption
        capsule.isUsed = true
        
        //Ha a waterLevel 0, akkor nincs víz a kávéfőzőben
        //A self.water-t ennek megfelelően nil-re kell állítani
        //Azért így vizsgálom, mert a Double típus számábrázolási pontatlanságaiból eredően lehet, hogy logikusan 0 lenne az érték, de a változóban valami elhanyagolhatóan kicsi
        //de nullától eltérő érték van. Pl:  0.000000000000443
        if(waterLevel < 0.000001) {
            self.water = nil
        }
        
        capsule.isUsed = true
        
        return coffee
    }
    
    func fillWaterTank(water : Water) {
        self.water = water
        waterLevel = waterTankSize
    }
    
    func fillWaterTank(filledWaterQuantity : Double, filledWater : Water) {
        if(filledWaterQuantity + waterLevel > waterTankSize) {
            debugPrint("Kifolyt a víz")
        }
        waterLevel = min(waterTankSize, filledWaterQuantity + waterLevel)
        water = filledWater
    }
    
    private func getAvailableCoffeeSizesAsString() -> String {
        var returnString = ""
        for actualCoffeeSize in availableCoffeeSizes {
            returnString = returnString + " " + actualCoffeeSize.rawValue
        }
        return returnString
    }
    
    func printCoffeeMakerDetails() {
        debugPrint("Víztartályban lévő víz: \(waterLevel)  --  víztartályban mérete:\(waterTankSize)")
    }
}
