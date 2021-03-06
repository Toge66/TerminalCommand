//
//  TerminalCommandSpetre.swift
//  TerminalCommand
//
//  Created by Toge Wu on 19/05/2017.
//
//

import Foundation
import Spectre
import PathKit
@testable import TerminalCommandKit

public func testTerminalCommandKit() {
    
    let fixture = Path(#file).parent()
    
    describe("TerminalCommandKit") {
        
        $0.describe("String Extension", closure: {
            
            $0.it("plain name", closure: { 
                let s1 = "sdfj@2x.png"
                let s2 = "pitjf@3X.png"
                let s3 = "/usr/local/lib/uuuuu@2x.png"
                let s4 = "/usr/local/lib/haha"
                
                let exts = ["png","jpg"]
                
                try expect(s1.plainName(extensions: exts)) == "sdfj"
                try expect(s2.plainName(extensions: exts)) == "pitjf"
                try expect(s3.plainName(extensions: exts)) == "uuuuu"
                try expect(s4.plainName(extensions: exts)) == "haha"
            })
        })
        
        $0.describe("String searcher", closure: {
            $0.it("swiftSearcher", closure: {
                let s1 = "UIImage(named:\"main_image\")"
                let s2 = "let name = \"sndfoji\""
                let s3 = "slfjoajf sfoij \"sdjfjaji\"slfoifa\"uuuuu\"slsgoifjoifieafaeioj\"sssssss\""
                let s4 = "slfo\"lunch.png\" sldjfj\"local.host\""
                
                let swiftSearcher = SwiftSearcher(extensions: ["png","jpg"])
                let result = [s1, s2, s3, s4].map{swiftSearcher.search(in: $0)}
                
                try expect(result[0]) == Set(["main_image"])
                try expect(result[1]) == Set(["sndfoji"])
                try expect(result[2]) == Set(["sdjfjaji","uuuuu","sssssss"])
                try expect(result[3]) == Set(["lunch", "local.host"])
            })
            
            $0.it("objcSearcher", closure: {
                let s1 = "[UIImage imagename:@\"main_iamge\"]"
                let s2 = ".image = [UIImage imageName:@\"haha\"]"
                let s3 = "NSString *name = @\"applyimage\"; [UIImage imageName:@\"shopping\"];"
                
                let objcSearcher = ObjcSearcher(extensions: ["png","jpg"])
                let result = [s1, s2, s3].map{objcSearcher.search(in: $0)}
                
                try expect(result[0]) == Set(["main_iamge"])
                try expect(result[1]) == Set(["haha"])
                try expect(result[2]) == Set(["applyimage","shopping"])
            })
            
            $0.it("generalSearcher", closure: {
                
                print(FileManager.default.currentDirectoryPath)
                print(fixture)
                
                let generalSearcher = GeneralSearcher(extensions: ["mm","jpm","mp4","mp3","wmv"])
                try expect(generalSearcher.patterns) == ["\"(.+?)\\.(mm | jpm | mp4 | mp3 | wmv)\""]
                
                let generalSearcher1 = GeneralSearcher(extensions: [])
                try expect(generalSearcher1.patterns) == []
            })
        })
    }
    
}
