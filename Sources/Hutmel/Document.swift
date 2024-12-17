struct Document: Node {
    let children: [any Node]
    var stringRepresentation: String {
        children.map { $0.stringRepresentation }.joined(separator: "")
    }
    
    init(children: [any Node]) {
        self.children = children
    }
}
