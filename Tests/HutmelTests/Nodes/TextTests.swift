import XCTest
import Hutmel



class TextTests: XCTestCase {
    let subject = Text("hello")
    
    
    func testString() {
        XCTAssertEqual(subject.stringRepresentation, "hello")
    }
    
    
    func testChildren() {
        XCTAssert(subject.children.isEmpty)
    }
}

