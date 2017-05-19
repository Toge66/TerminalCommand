import XCTest
@testable import TerminalCommandKit

class TerminalCommandKitTest: XCTestCase {
    
    func testTermianlCommandKitSpec() {
        testTerminalCommandKit()
    }
    
    func testStringPlainName() {
        let s1 = "sdfj@2x.png"
        let s2 = "pitjf@3x.png"
        let s3 = "/usr/local/lib/uuuuu@2x.png"
        let s4 = "/usr/local/lib/haha"
        
        XCTAssert(s1.plainName == "sdfj", "\(s1) 错误")
        XCTAssert(s2.plainName == "pitjf", "\(s2) 错误")
        XCTAssert(s3.plainName == "uuuuu", "\(s3) 错误")
        XCTAssert(s4.plainName == "haha", "\(s4) 错误")
    }
}
