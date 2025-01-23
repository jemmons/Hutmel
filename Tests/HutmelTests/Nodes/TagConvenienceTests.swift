import Testing
import Hutmel


struct linkTests {
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


struct metaTests {
    @Test func base() {
        let subject = Tag.meta(name: "x-icon", content: "/ico.bmp")
        #expect(subject.stringRepresentation.hasPrefix("<meta "))
        #expect(!subject.stringRepresentation.contains("</meta>"))
        #expect(!subject.stringRepresentation.contains("/>"))
        #expect(subject.stringRepresentation.contains(#" name="x-icon""#))
        #expect(subject.stringRepresentation.contains(#" content="/ico.bmp""#))
    }
}

struct brTests {
    @Test func isVoidElement() {
        #expect(Tag.br().stringRepresentation == "<br>")
    }
}


struct hrTests {
    @Test func isVoidElement() {
        #expect(Tag.hr().stringRepresentation == "<hr>")
    }
}


struct imgTests {
    @Test func isVoidElement() {
        #expect(Tag.img(src: "example.png").stringRepresentation == #"<img src="example.png">"#)
    }
}
