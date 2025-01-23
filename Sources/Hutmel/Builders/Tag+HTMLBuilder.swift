import Foundation



public extension Tag {
    init(_ name: String, _ attributes: [String: String?] = [:], lines: Bool = false, @HTMLBuilder builder: () -> Fragment) {
        self.init(name, attributes, children: builder().children, lines: lines)
    }
    

    static func div(_ attributes: [String: String?] = [:], lines: Bool = true, @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("div", attributes, lines: lines, builder: builder)
    }
    
    
    static func a(href: URL, target: AnchorTarget? = nil, _ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return a(href: href.absoluteString, target: target, attributes, builder: builder)
    }

    
    static func a(href: String, target: AnchorTarget? = nil, _ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        var attr: [String: String?] = ["href": href]
        if let someTarget = target {
            attr["target"] = someTarget.description
        }
        attr.merge(attributes) { $1 }
        return Tag("a", attr, builder: builder)
    }
    
    
    static func p(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("p", attributes, builder: builder)
    }
    
    
    static func br() -> Tag {
        return Tag("br", children: nil)
    }
    
    
    static func hr(_ attributes: [String: String?] = [:]) -> Tag {
        return Tag("hr", attributes, children: nil)
    }
    
    
    static func b(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("b", attributes, builder: builder)
    }
    
    
    static func h1(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("h1", attributes, builder: builder)
    }
    
    
    static func h2(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("h2", attributes, builder: builder)
    }
    
    
    static func head(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("head", attributes, lines: true, builder: builder)
    }
    
    
    static func script(src: String? = nil, _ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        var attr: [String: String?] = [:]
        if let someSRC = src {
            attr["src"] = someSRC
        }
        attr.merge(attributes) { $1 }
        return Tag("script", attr, builder: builder )
    }
    
    
    static func link(href: String, rel: [Relationship], _ attributes: [String: String?] = [:]) -> Tag {
        var attr: [String: String?] = [
            "href": href,
            "rel": rel.map(\.description).joined(separator: " ")
        ]
        attr.merge(attributes) { $1 }
        return Tag("link", attr, children: nil)
    }
    
    
    static func meta(name: String, content: String) -> Tag {
        return Tag("meta", ["name": name, "content": content], children: nil)
    }
    
    
    static func body(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("body", attributes, lines: true, builder: builder)
    }
    
    
    static func title(@HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("title", children: builder().children)
    }
    
    
    static func ul(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("ul", attributes, children: builder().children)
    }
    
    
    static func li(_ attributes: [String: String?] = [:], @HTMLBuilder builder: () -> Fragment = { Fragment.empty }) -> Tag {
        return Tag("li", attributes, children: builder().children)
    }
    
    
    static func img(src: URL, alt: String? = nil, _ attributes: [String: String?] = [:]) -> Tag {
        return img(src: src.absoluteString, alt: alt, attributes)
    }

    static func img(src: String, alt: String? = nil, _ attributes: [String: String?] = [:]) -> Tag {
        var attr: [String: String?] = ["src": src]
        if let someAlt = alt {
            attr["alt"] = someAlt
        }
        attr.merge(attributes) { $1 }
        
        return Tag("img", attr, children: nil)
    }
}
