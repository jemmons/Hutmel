public struct Text: Node, ExpressibleByStringLiteral {
    public let stringRepresentation: String
    public let children: [any Node] = []
    
    
    public init(stringLiteral value: StringLiteralType) {
        self.stringRepresentation = value
    }
}
