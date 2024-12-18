public enum Build {
    public static func html(@HTMLBuilder content: (Tag.Type) -> [any Node]) -> String {
        content(Tag.self).map { $0.stringRepresentation }.joined(separator: "")
    }
    public static func html(@HTMLBuilder content: () -> [any Node]) -> String {
        content().map { $0.stringRepresentation }.joined(separator: "")
    }
}
