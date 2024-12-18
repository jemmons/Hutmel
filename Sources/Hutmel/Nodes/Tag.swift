public struct Tag: Node {
    private let name: String
    private let attributes: [String: String?]
    public let children: [any Node]

    
    public var stringRepresentation: String {
        Helper.makeOpenTag(name: name, attributes: attributes)
        + Helper.makeInner(children: children)
        + Helper.makeCloseTag(name: name)
    }
    
    
    public init(_ name: String, attributes: [String: String?] = [:], children: [any Node] = []) {
        self.name = name
        self.attributes = attributes
        self.children = children
    }
}



public extension Tag {
    static func p(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> [any Node] = {[]}) -> Tag {
        return Tag("p", attributes: attributes, builder: builder)
    }
    
    static func b(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> [any Node] = {[]}) -> Tag {
        return Tag("b", attributes: attributes, builder: builder)
    }
}



private enum Helper {
    static func makeOpenTag(name: String, attributes: [String: String?]) -> String {
        var comps: [String] = [name]
        comps.append(contentsOf: attributeComponents(attributes: attributes) )
        return "<" + comps.joined(separator: " ") + ">"
    }

    
    static func makeCloseTag(name: String) -> String { "</\(name)>" }

    
    static func makeInner(children: [any Node]) -> String {
        children.map { $0.stringRepresentation }.joined(separator: "")
    }
    
    
    private static func attributeComponents(attributes: [String: String?]) -> [String] {
        attributes.map { key, value in
            switch value {
            case nil:
                return key
            case let v?:
                return "\(key)=\"\(v)\""
            }
        }
    }
}
