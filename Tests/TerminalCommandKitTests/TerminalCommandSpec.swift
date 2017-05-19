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
        
        $0.describe("String searcher", closure: {
            $0.it("swiftSearcher", closure: {
                let s1 = "UIImage(name\"main_image\")"
                let s2 = "let name = \"sndfoji\""
                let s3 = "slfjoajf sfoij \"sdjfjaji\"slfoifa\"uuuuu\"slsgoifjoifieafaeioj\"sssssss\""
                
                let swiftSearcher = SwiftSearcher()
                let result = [s1, s2, s3].map{swiftSearcher.search(in: $0)}
                
                try expect(result[0]) == Set(["main_image"])
                try expect(result[1]) == Set(["sndfoji"])
                try expect(result[2]) == Set(["sdjfjaji","uuuuu","sssssss"])
            })
            
            $0.it("objcSearcher", closure: {
                let s1 = "[UIImage imagename:@\"main_iamge\"]"
                let s2 = ".image = [UIImage imageName:@\"haha\"]"
                let s3 = "NSString *name = @\"applyimage\"; [UIImage imageName:@\"shopping\"];"
                
                let objcSearcher = ObjcSearcher()
                let result = [s1, s2, s3].map{objcSearcher.search(in: $0)}
                
                try expect(result[0]) == Set(["main_iamge"])
                try expect(result[1]) == Set(["haha"])
                try expect(result[2]) == Set(["applyimage","shopping"])
            })
            
            $0.it("generalSearcher", closure: {
                let generalSearcher = GeneralSearcher(extensions: ["mm","jpm","mp4","mp3","wmv"])
                try expect(generalSearcher.patterns) == ["\"(.+?)\\.(mm | jpm | mp4 | mp3 | wmv)\""]
                
                let generalSearcher1 = GeneralSearcher(extensions: [])
                try expect(generalSearcher1.patterns) == []
            })
        })
    }
    
}
