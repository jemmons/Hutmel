import Testing
import Hutmel


struct HTMLConditionalTests {
    @Test func optional() {
        var showTitle = true
        @HTMLBuilder var build: Fragment {
            if showTitle {
                Tag.h1 { "TITLE" }
            }
            Tag.p { "hello" }
        }
        
        let trueSubject = build.stringRepresentation
        showTitle = false
        let falseSubject = build.stringRepresentation
        
        #expect(trueSubject == "<h1>TITLE</h1><p>hello</p>")
        #expect(falseSubject == "<p>hello</p>")
    }
    
    
    @Test func conditional() {
        var name: String?
        @HTMLBuilder var build: Fragment {
            if let someName = name {
                Tag.p { someName }
            } else {
                Tag.p { "you" }
            }
        }
        
        let trueSubject = build.stringRepresentation
        name = "Josh"
        let falseSubject = build.stringRepresentation
        
        #expect(trueSubject == "<p>you</p>")
        #expect(falseSubject == "<p>Josh</p>")
        
    }
}
