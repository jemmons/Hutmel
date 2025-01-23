public struct Text: Node {
    public let stringRepresentation: String
    public let children: [any Node]? = nil
    
    
    public init(_ value: String) {
        self.stringRepresentation = value
    }
}
