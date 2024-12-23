import XCTest
import Hutmel



class HTMLBuilderTests: XCTestCase {
    func testNodeExpressions() {
        let subject = Build.fragment {
            Tag("h1", children: [Text("Hello:")])
            CR()
            Tag("p", children: [Text("Hello…")])
        }
        XCTAssertEqual(subject.stringRepresentation, "<h1>Hello:</h1>\n<p>Hello…</p>")
    }
    
    
    func testStringExpressions() {
        let subject = Build.fragment {
            Tag("p")
            "thing"
        }
        XCTAssertEqual(subject.stringRepresentation, "<p></p>thing")
    }
    
    
    func testNestedExpressions() {
        let subject = Build.fragment {
            Tag("p") {
                "Hello "
                Tag("i") {
                    "World!"
                }
            }
        }
        XCTAssertEqual(subject.stringRepresentation, "<p>Hello <i>World!</i></p>")
    }
    
    
    func testConvenienceNodes() {
        let subject = Build.fragment {
            Tag.p {
                "hello "
                Tag.b { "world!" }
            }
        }
        XCTAssertEqual(subject.stringRepresentation, "<p>hello <b>world!</b></p>")
    }
    
    
    func testDocument() {
        let subject = Build.html {
            Tag.head {
                Tag.title { "My Page" }
            }
            Tag.body {
                Tag.h1 { "Welcome!" }
                Tag.p {
                    "You may enjoy "
                    Tag.a(href: "http://example.com") { "this" }
                    "."
                }
            }
        }
        XCTAssertEqual(subject.stringRepresentation, """
        <html>
        <head>
        <title>My Page</title>
        </head>
        <body>
        <h1>Welcome!</h1>
        <p>You may enjoy <a href="http://example.com">this</a>.</p>
        </body>
        </html>
        """)
    }
}
