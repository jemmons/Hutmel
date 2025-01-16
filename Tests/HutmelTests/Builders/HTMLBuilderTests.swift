import Testing
import Hutmel



@Test func nodeExpressions() {
    let subject = Build.fragment {
        Tag("h1", children: [Text("Hello:")])
        CR()
        Tag("p", children: [Text("Hello…")])
    }
    #expect(subject.stringRepresentation == "<h1>Hello:</h1>\n<p>Hello…</p>")
}

    
@Test func stringExpressions() {
    let subject = Build.fragment {
        Tag("p")
        "thing"
    }
    #expect(subject.stringRepresentation == "<p></p>thing")
}
    
    
@Test func nestedExpressions() {
    let subject = Build.fragment {
        Tag("p") {
            "Hello "
            Tag("i") {
                "World!"
            }
        }
    }
    #expect(subject.stringRepresentation == "<p>Hello <i>World!</i></p>")
}

    
@Test func convenienceNodes() {
    let subject = Build.fragment {
        Tag.p {
            "hello "
            Tag.b { "world!" }
        }
    }
    #expect(subject.stringRepresentation == "<p>hello <b>world!</b></p>")
}


@Test func document() {
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
    #expect(subject.stringRepresentation == """
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
