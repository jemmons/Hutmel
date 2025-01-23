public struct Fragment: Node {
    public static let empty = Fragment([])
    public var children: [any Node]?
    public var stringRepresentation: String {
        guard let someChildren = children else {
            return ""
        }
        return someChildren.map { $0.stringRepresentation }.joined(separator: "")
    }
    
    public init(_ children: [any Node]?) {
        self.children = children
    }
}
