import Testing
import Hutmel


struct LinkTests {
    @Test func base() {
        let subject = Hutmel.Tag.link(href: "example.com", rel: [.canonical])
        #expect(subject.stringRepresentation.hasPrefix("<link "))
        #expect(!subject.stringRepresentation.contains("</link>"))
        #expect(!subject.stringRepresentation.contains("/>"))
        #expect(subject.stringRepresentation.contains(#"href="example.com""#))
        #expect(subject.stringRepresentation.contains(#"rel="canonical""#))
    }
    
    @Test func multipleRel() {
        let subject = Hutmel.Tag.link(href: "example.com", rel: [.canonical, .alternate, .nofollow])
        #expect(subject.stringRepresentation.contains(#"rel="canonical alternate nofollow""#))
    }
    
    @Test func otherRel() {
        let subject = Hutmel.Tag.link(href: "example.com", rel: [.dnsPrefetch, .other("foo-bar")])
        #expect(subject.stringRepresentation.contains(#"rel="dns-prefetch foo-bar""#))

    }
}


struct MetaTests {
    @Test func base() {
        let subject = Tag.meta(name: "x-icon", content: "/ico.bmp")
        #expect(subject.stringRepresentation.hasPrefix("<meta "))
        #expect(!subject.stringRepresentation.contains("</meta>"))
        #expect(!subject.stringRepresentation.contains("/>"))
        #expect(subject.stringRepresentation.contains(#" name="x-icon""#))
        #expect(subject.stringRepresentation.contains(#" content="/ico.bmp""#))
    }
}

struct BRTests {
    @Test func isVoidElement() {
        #expect(Tag.br().stringRepresentation == "<br>")
    }
}


struct HRTests {
    @Test func isVoidElement() {
        #expect(Tag.hr().stringRepresentation == "<hr>")
    }
}


struct ImgTests {
    @Test func isVoidElement() {
        #expect(Tag.img(src: "example.png").stringRepresentation == #"<img src="example.png">"#)
    }
}


struct DivTests {
    @Test func lines() {
        let subject = Tag.div() {
            Tag.p { "Hello" }
            "Bare"
            Tag.p { "World" }
        }
        #expect(subject.stringRepresentation == """
        <div>
        <p>Hello</p>
        Bare
        <p>World</p>
        </div>
        """)
    }

    @Test func noLines() {
        let subject = Tag.div(lines: false) {
            Tag.p { "Hello" }
            "Bare"
            Tag.p { "World" }
        }
        #expect(subject.stringRepresentation == "<div><p>Hello</p>Bare<p>World</p></div>")
    }
}



struct ScriptTests {
    @Test func basic() {
        let subject = Tag.script()
        #expect(subject.stringRepresentation == "<script></script>")
    }
    
    @Test func hasSrc() {
        let subject = Tag.script(src: "file.js")
        #expect(subject.stringRepresentation.contains(#" src="file.js""#))
    }
    
    @Test func hasBody() {
        let subject = Tag.script { "console.log('foo');" }
        #expect(subject.stringRepresentation == "<script>console.log('foo');</script>")
    }
}
