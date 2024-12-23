import XCTest
import Hutmel


class HTMLConditionalTests: XCTestCase {
    func testOptional() {
        var showTitle = true
        @HTMLBuilder var build: Fragment {
            if showTitle {
                Tag.h1 { "TITLE" }
            }
            Tag.p { "hello" }
        }
        
        let trueSubject = build.stringRepresentation
        showTitle = false
        let falseSubject = build.stringRepresentation
        
        XCTAssertEqual(trueSubject, "<h1>TITLE</h1><p>hello</p>")
        XCTAssertEqual(falseSubject, "<p>hello</p>")
    }
    
    
    func testConditional() {
        var name: String?
        @HTMLBuilder var build: Fragment {
            if let someName = name {
                Tag.p { someName }
            } else {
                Tag.p { "you" }
            }
        }
        
        let trueSubject = build.stringRepresentation
        name = "Josh"
        let falseSubject = build.stringRepresentation
        
        XCTAssertEqual(trueSubject, "<p>you</p>")
        XCTAssertEqual(falseSubject, "<p>Josh</p>")

    }

}
