public struct Tag: Node {
    private let name: String
    private let attributes: [String: String?]
    public let children: [any Node]
    public let childPerLine: Bool

    
    public var stringRepresentation: String {
        Helper.makeOpenTag(name: name, attributes: attributes)
        + Helper.makeInner(children: children, childPerLine: childPerLine)
        + Helper.makeCloseTag(name: name)
    }
    
    
    public init(_ name: String, _ attributes: [String: String?] = [:], children: [any Node] = [], lines: Bool = false) {
        self.name = name
        self.attributes = attributes
        self.children = children
        self.childPerLine = lines
    }
}



private enum Helper {
    static func makeOpenTag(name: String, attributes: [String: String?]) -> String {
        var comps: [String] = [name]
        comps.append(contentsOf: attributeComponents(attributes: attributes) )
        return "<" + comps.joined(separator: " ") + ">"
    }

    
    static func makeCloseTag(name: String) -> String { "</\(name)>" }

    
    static func makeInner(children: [any Node], childPerLine: Bool) -> String {
        let seperator = childPerLine ? "\n" : ""
        var childrenBuf = seperator
        childrenBuf += children.map { $0.stringRepresentation }.joined(separator: seperator)
        childrenBuf += seperator
        return childrenBuf
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
