import Algorithms



public extension Build {
    static func html(attributes: [String: String?] = [:], @HTMLBuilder body: () -> Fragment) -> Tag {
        return Tag(
            "html",
            attributes: attributes,
            children: body().children,
            lines: true
        )
    }
}


