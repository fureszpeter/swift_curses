//
//  Programmer.swift
//  06
//
//  Created by Andras Somlai on 2018. 04. 05..
//  Copyright © 2018. IT Academy. All rights reserved.
//

import Cocoa

class Programmer: Human {
//    override var salary: Int //ERROR
    override var moneyForCoffee: Double {
        get {
            return Double(money) * 0.2
        }
    }
    override var mood: Mood {
        didSet {
            debugPrint("\(self.name)(programozó) hangulata megváltozott. Új hangulat:\(mood.rawValue)")
        }
    }
    
    override init() {
        super.init()
        debugPrint("Új programozó objektum lett létrehozva")
        personalityType = .modern
    }
    
    override init(gender : Gender, name : String) {
        super.init(gender: gender, name: name)
        personalityType = .modern
        debugPrint("Új programozó objektum lett létrehozva")
    }
    
//    func testAccess() {
//        debugPrint(publicVar)
//        debugPrint(filePrivateVar)
//        debugPrint(privateVar)
//        debugPrint(openVar)
//        debugPrint(internalVar)
//        
//    }
}


//class RandomClassInOtherFile : NSObject {
//    //    https://useyourloaf.com/blog/swift-4-access-levels/
//    func testAccess() {
//        
//        let human = Human()
//        debugPrint(human.publicVar)
////        debugPrint(human.filePrivateVar) ERROR
////        debugPrint(human.privateVar) ERROR
//        debugPrint(human.openVar)
//        debugPrint(human.internalVar)
//        
//        let child = Child()
//        debugPrint(child.publicVar)
////        debugPrint(child.filePrivateVar) ERROR
////        debugPrint(child.privateVar) ERROR
//        debugPrint(child.openVar)
//        debugPrint(child.internalVar)
//        
//    }
//}

