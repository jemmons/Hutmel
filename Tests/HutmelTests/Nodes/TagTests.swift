import XCTest
import Hutmel



class TagTests: XCTestCase {
    func testRendersName() {
        let subject = Tag("name")
        XCTAssertEqual(subject.stringRepresentation, "<name></name>")
    }
    
    func testRendersAttributes() {
        let subject = Tag("a", attributes: ["href": "http://example.com", "target": "_blank"])
        XCTAssert(subject.stringRepresentation.hasPrefix("<a "))
        XCTAssert(subject.stringRepresentation.hasSuffix("></a>"))
        XCTAssert(subject.stringRepresentation.contains(" href=\"http://example.com\""))
        XCTAssert(subject.stringRepresentation.contains(" target=\"_blank\""))
    }
    
    func testNameOnlyAttributes() {
        let subject = Tag("option", attributes: ["selected":nil, "value":"blue"])
        XCTAssert(subject.stringRepresentation.hasPrefix("<option "))
        XCTAssert(subject.stringRepresentation.hasSuffix("></option>"))
        XCTAssert(subject.stringRepresentation.contains(" selected"))
        XCTAssert(subject.stringRepresentation.contains(" value=\"blue\""))
    }
    
    func testContent() {
        let subject: Tag = Tag("p", children: [
            CR(),
            Text("Hello "),
            Tag("b", children: [Text("World")]),
            CR(),
        ])
        XCTAssertEqual(subject.stringRepresentation, """
        <p>
        Hello <b>World</b>
        </p>
        """)
    }
}
