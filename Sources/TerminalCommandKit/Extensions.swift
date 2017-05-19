//
//  Extensions.swift
//  TerminalCommand
//
//  Created by Toge Wu on 18/05/2017.
//
//

import Foundation
import PathKit

extension String {
    
    var fullRange: NSRange {
        return NSMakeRange(0, utf16.count)
    }
    
    func plainName(extensions:[String]) -> String {
        let p = Path(self.lowercased())
        var result: String
        if let ext = p.extension, extensions.contains(ext) {
            result = p.lastComponentWithoutExtension
        }else {
            result = p.lastComponent
        }
        
        if result.hasSuffix("@2x") || result.hasSuffix("@3x") {
            result = String(describing: result.utf16.dropLast(3))
        }
        
        return result
    }
    
//    var plainName: String {
//        let p = Path(self.lowercased())
//        var result = p.lastComponentWithoutExtension
//        if result.hasSuffix("@2x") || result.hasSuffix("@3x") {
//            result = String(describing: result.utf16.dropLast(3))
//        }
//        return result
//    }
}
