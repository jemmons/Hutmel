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
    
    
    public init(_ name: String, attributes: [String: String?] = [:], children: [any Node] = [], lines: Bool = false) {
        self.name = name
        self.attributes = attributes
        self.children = children
        self.childPerLine = lines
    }
}



public extension Tag {
    static func a(href: String, attributes: [String: String?] = [:], @HTMLBuilder builder: () -> [any Node] = {[]}) -> Tag {
        var attr = attributes
        attr["href"] = href
        return Tag("a", attributes: attr, children: builder())
    }
    
    
    static func p(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> [any Node] = {[]}) -> Tag {
        return Tag("p", attributes: attributes, children: builder())
    }
    
    
    static func b(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> [any Node] = {[]}) -> Tag {
        return Tag("b", attributes: attributes, children: builder())
    }
    
    
    static func h1(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> [any Node] = {[]}) -> Tag {
        return Tag("h1", attributes: attributes, children: builder())
    }

    
    static func h2(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> [any Node] = {[]}) -> Tag {
        return Tag("h2", attributes: attributes, children: builder())
    }

    
    static func head(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> [any Node] = {[]}) -> Tag {
        return Tag("head", attributes: attributes, children: builder(), lines: true)
    }
    
    
    static func body(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> [any Node] = {[]}) -> Tag {
        return Tag("body", attributes: attributes, children: builder(), lines: true)
    }


    static func title(_ content: String) -> Tag {
        return Tag("title", children: [Text(content)])
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
