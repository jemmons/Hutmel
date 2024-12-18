public extension Tag {
    init(_ name: String, attributes: [String: String?] = [:], @HTMLBuilder builder: ()->[any Node]) {
        self.init(name, attributes: attributes, children: builder())
    }    
}
