import Testing
import Hutmel


struct CRTests {
    @Test func stringIsNewline() {
        #expect(CR().stringRepresentation == "\n")
    }
    
    
    @Test func childrenIsNil() {
        #expect(CR().children == nil)
    }
}
