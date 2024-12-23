public extension Tag {
    init(_ name: String, attributes: [String: String?] = [:], lines: Bool = false, @HTMLBuilder builder: () -> Fragment) {
        self.init(name, attributes: attributes, children: builder().children, lines: lines)
    }

    
    static func a(href: String, attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        var attr = attributes
        attr["href"] = href
        return Tag("a", attributes: attr, builder: builder)
    }
    
    
    static func p(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("p", attributes: attributes, builder: builder)
    }
    
    
    static func b(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("b", attributes: attributes, builder: builder)
    }
    
    
    static func h1(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("h1", attributes: attributes, builder: builder)
    }
    
    
    static func h2(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("h2", attributes: attributes, builder: builder)
    }
    
    
    static func head(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("head", attributes: attributes, lines: true, builder: builder)
    }
    
    
    static func body(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("body", attributes: attributes, lines: true, builder: builder)
    }
    
    
    static func title(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("title", children: builder().children)
    }
}
