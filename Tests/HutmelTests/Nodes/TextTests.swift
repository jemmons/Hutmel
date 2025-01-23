import Testing
import Hutmel


struct TextTests {
    @Test func hasString() {
        #expect(Text("hello").stringRepresentation == "hello")
    }
    
    
    @Test func childrenIsNil() {
        #expect(Text("hello").children == nil)
    }
}
