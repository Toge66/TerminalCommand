//
//  TerminalCommandSpetre.swift
//  TerminalCommand
//
//  Created by Toge Wu on 19/05/2017.
//
//

import Foundation
import Spectre
@testable import TerminalCommandKit

public func testTerminalCommandKit() {
    
    describe("TerminalCommandKit") {
        $0.describe("String Extension", closure: {
            
            $0.it("plain name", closure: { 
                let s1 = "sdfj@2x.png"
                let s2 = "pitjf@3X.png"
                let s3 = "/usr/local/lib/uuuuu@2x.png"
                let s4 = "/usr/local/lib/haha"
                
                try expect(s1.plainName) == "sdfj"
                try expect(s2.plainName) == "pitjf"
                try expect(s3.plainName) == "uuuuu"
                try expect(s4.plainName) == "haha"
            })
        })
    }
    
}
