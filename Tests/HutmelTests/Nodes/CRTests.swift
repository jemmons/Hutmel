import XCTest
import Hutmel



class CRTests: XCTestCase {
    let subject = CR()
    
    
    func testString() {
        XCTAssertEqual(subject.stringRepresentation, "\n")
    }
    
    
    func testChildren() {
        XCTAssert(subject.children.isEmpty)
    }
}

