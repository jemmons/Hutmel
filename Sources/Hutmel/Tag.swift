struct Tag: Node {
    typealias Attributes = [String: String?]
    let name: String
    let attributes: Attributes
    let children: [any Node]
    
    init(name: String, attributes: Attributes = [:], children: [any Node] = []) {
        self.name = name
        self.attributes = attributes
        self.children = children
    }
    
    var stringRepresentation: String {
        return makeOpenTag() + makeChildren() + makeCloseTag()
    }
    
    private func makeOpenTag() -> String {
        var comps: [String] = [name]
        comps.append(contentsOf: attrComps() )
        return "<" + comps.joined(separator: " ") + ">"
    }
    
    private func makeCloseTag() -> String { "</\(name)>" }

    private func makeChildren() -> String {
        children.map { $0.stringRepresentation }.joined(separator: "")
    }
    
    private func attrComps() -> [String] {
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
