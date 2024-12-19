public extension Build {
    static func fragment(@HTMLBuilder content: (Tag.Type) -> [any Node]) -> String {
        content(Tag.self).map { $0.stringRepresentation }.joined(separator: "")
    }
    
    
    static func fragment(@HTMLBuilder content: () -> [any Node]) -> String {
        content().map { $0.stringRepresentation }.joined(separator: "")
    }
}
