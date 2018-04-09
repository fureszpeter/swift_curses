//
//  Capsule.swift
//  06
//
//  Created by Andras Somlai on 2018. 04. 05..
//  Copyright © 2018. IT Academy. All rights reserved.
//

import Cocoa

class Capsule {
    var taste : CoffeeTaste = .normal {
        didSet {
            self.caffiene = Capsule.getCaffeineFor(taste: taste)
            self.color = Capsule.getColorFor(taste: .normal)
        }
    }
    var color : String = Capsule.getColorFor(taste: .normal)
    var caffiene : Double = Capsule.getCaffeineFor(taste: .normal)
    var isUsed : Bool = false
    var producer : String = "CapsuleMaker CO"
    static let prices : [CoffeeTaste : Double] = [.normal : 100, .caramel : 150, .vanilla: 150, .coconut: 200]
    
    static func getColorFor(taste : CoffeeTaste) -> String {
        switch taste {
        case .caramel: return "brown"
        case .vanilla: return "yellow"
        case .coconut: return "blue"
        case .normal: return "black"
        }
    }
    
    static func getCaffeineFor(taste : CoffeeTaste) -> Double {
        switch taste {
        case .caramel: return 7.4
        case .vanilla: return 5.2
        case .coconut: return 2.1
        case .normal: return 9.6
        }
    }
}
