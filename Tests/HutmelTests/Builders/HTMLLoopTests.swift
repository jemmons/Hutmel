import Testing
import Hutmel



struct HTMLLoopTests {
    @Test func testLoop() {
        let names = ["Abba", "Beck", "Charli"]
        let subject = Build.fragment {
            Tag.ul {
                CR()
                for name in names {
                    Tag.li { name }
                    CR()
                }
            }
            
        }
        #expect(subject.stringRepresentation == """
    <ul>
    <li>Abba</li>
    <li>Beck</li>
    <li>Charli</li>
    </ul>
    """)
    }
}
