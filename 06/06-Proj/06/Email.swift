//
//  Email.swift
//  06
//
//  Created by Andras Somlai on 2018. 04. 05..
//  Copyright © 2018. IT Academy. All rights reserved.
//

import Cocoa

class Email: NSObject {
    var provider : String? //gmail
    var mailbox : String? //kacsa
    var domain : String? //com
    
    var emailString : String {
        set {
            let separated = newValue.components(separatedBy: "@")
            self.mailbox = separated[0]
            let separated2 = separated[1].components(separatedBy: ".")
            self.provider = separated2[0]
            self.domain = separated2[1]
        }
        get {
            return "\(self.mailbox!)@\(self.provider!).\(self.domain!)"
        }
    }
}
