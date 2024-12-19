import Algorithms



public extension Build {
    static func html(attributes: [String: String?] = [:], @HTMLBuilder body: (Tag.Type) -> [any Node]) -> String {
        return Tag(
            "html",
            attributes: attributes,
            children: body(Tag.self),
            lines: true
        ).stringRepresentation
    }
    
    
    static func html(attributes: [String: String?] = [:], @HTMLBuilder body: () -> [any Node]) -> String {
        return Tag(
            "html",
            attributes: attributes,
            children: body(),
            lines: true
        ).stringRepresentation
    }
}


