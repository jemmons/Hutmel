import XCTest
import Hutmel



class HTMLBuilderTests: XCTestCase {
    func testNodeExpressions() {
        let subject = Build.fragment {
            Tag("h1", children: [Text("Hello:")])
            CR()
            Tag("p", children: [Text("Hello…")])
        }
        XCTAssertEqual(subject, "<h1>Hello:</h1>\n<p>Hello…</p>")
    }
    
    
    func testStringExpressions() {
        let subject = Build.fragment {
            Tag("p")
            "thing"
        }
        XCTAssertEqual(subject, "<p></p>thing")
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
        XCTAssertEqual(subject, "<p>Hello <i>World!</i></p>")
    }
    
    
    func testConvenienceNodes() {
        let subject = Build.fragment { tag in
            tag.p {
                "hello "
                tag.b { "world!" }
            }
        }
        XCTAssertEqual(subject, "<p>hello <b>world!</b></p>")
    }
    
    
    func testDocument() {
        let subject = Build.html { t in
            t.head {
                t.title("My Page")
            }
            t.body {
                t.h1 { "Welcome!" }
                t.p {
                    "You may enjoy "
                    t.a(href: "http://example.com") { "this" }
                    "."
                }
            }
        }
        XCTAssertEqual(subject, """
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
