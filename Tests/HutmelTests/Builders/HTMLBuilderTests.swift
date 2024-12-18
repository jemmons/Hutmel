import XCTest
import Hutmel



class HTMLBuilderTests: XCTestCase {
    func testNodeExpressions() {
        let subject = Build.html {
            Tag("h1", children: [Text("Hello:")])
            CR()
            Tag("p", children: [Text("Hello…")])
        }
        XCTAssertEqual(subject, "<h1>Hello:</h1>\n<p>Hello…</p>")
    }
    
    
    func testStringExpressions() {
        let subject = Build.html {
            Tag("p")
            "thing"
        }
        XCTAssertEqual(subject, "<p></p>thing")
    }
    
    
    func testNestedExpressions() {
        let subject = Build.html {
            Tag("p") {
                "Hello "
                Tag("i") {
                    "World!"
                }
            }
        }
        XCTAssertEqual(subject, "<p>Hello <i>World!</i></p>")
    }
    
    
    func testConvenienceNodes() {
        let subject = Build.html { tag in
            tag.p() {
                "hello "
                tag.b() { "world!" }
            }
        }
        XCTAssertEqual(subject, "<p>hello <b>world!</b></p>")

    }
}
