import Testing
import Hutmel


struct TagTests {
    @Test func rendersName() {
        let subject = Tag("name")
        #expect(subject.stringRepresentation == "<name></name>")
    }
    
    
    @Test func rendersVoidElement() {
        let subject = Tag("name", children: nil)
        #expect(subject.stringRepresentation == "<name>")
    }
    
    
    @Test func rendersAttributes() {
        let subject = Tag("a", ["href": "http://example.com", "target": "_blank"])
        #expect(subject.stringRepresentation.hasPrefix("<a "))
        #expect(subject.stringRepresentation.hasSuffix("></a>"))
        #expect(subject.stringRepresentation.contains(" href=\"http://example.com\""))
        #expect(subject.stringRepresentation.contains(" target=\"_blank\""))
    }
    
    
    @Test func nameOnlyAttributes() {
        let subject = Tag("option", ["selected":nil, "value":"blue"])
        #expect(subject.stringRepresentation.hasPrefix("<option "))
        #expect(subject.stringRepresentation.hasSuffix("></option>"))
        #expect(subject.stringRepresentation.contains(" selected"))
        #expect(subject.stringRepresentation.contains(" value=\"blue\""))
    }
    
    
    @Test func content() {
        let subject = Tag("p", children: [
            CR(),
            Text("Hello "),
            Tag("b", children: [Text("World")]),
            CR(),
        ])
        #expect(subject.stringRepresentation == """
    <p>
    Hello <b>World</b>
    </p>
    """)
    }
}
