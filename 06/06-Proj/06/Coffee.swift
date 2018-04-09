//
//  Coffee.swift
//  06
//
//  Created by Andras Somlai on 2018. 04. 05..
//  Copyright © 2018. IT Academy. All rights reserved.
//

import Cocoa

//Enum a kávéméret egyszerűbb definiálásához
enum CoffeeSize : String {
    case extraSmall = "extra kicsi"
    case small = "kicsi"
    case medium = "közepes"
    case large = "nagy"
    case extraLarge = "extra nagy"
}

enum CoffeeTaste : String {
    case caramel = "Karamell"
    case vanilla = "Vanília"
    case coconut = "Kókusz"
    case normal = "Normál"
}

class Coffee {
    var taste : CoffeeTaste? = nil
    var amount : Double? = nil
    var quality : Double? = nil
    var caffeine : Double? = nil
    
    init(machine : CoffeeMaker, water : Water, capsule : Capsule) {
        taste = capsule.taste //Az objektum taste propertyjét beállítom a paraméter taste propertyje szerint
        
        quality = Double(water.quality) //Az objektum quality propertyjét beállítom a paraméter quality propertyje szerint.
        //Mivel más típusú a két property, castolnom is kell
        
        caffeine = capsule.caffiene//Az objektum caffiene propertyjét beállítom a paraméter caffiene propertyje szerint
    }
    
    static func coffeeAmountFor(size : CoffeeSize) -> Double {
        switch size {
        case .extraSmall: return 0.05
        case .small: return 0.1
        case .medium: return 0.25
        case .large: return 0.4
        case .extraLarge: return 0.5
        }
    }
}
