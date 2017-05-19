//
//  StringSearchRule.swift
//  TerminalCommand
//
//  Created by Toge Wu on 18/05/2017.
//
//

import Foundation

protocol StringSeacher {
    func search(in content: String) -> Set<String>
}

protocol RegexStringSearcher: StringSeacher {
    var patterns:[String] {get}
}

extension RegexStringSearcher {
    func search(in content: String) -> Set<String> {
        
        var result = Set<String>()
        
        for pattern in patterns {
            guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
                print("failed to create regular expression")
                continue
            }
            
            let matchs = regex.matches(in: content, options: [], range: content.fullRange)
            for checkingResult in matchs {
                let range = checkingResult.rangeAt(1)
                let extracked = NSString(string: content).substring(with: range)
                result.insert(extracked.plainName)
            }
        }
        
        return result
    }
}
