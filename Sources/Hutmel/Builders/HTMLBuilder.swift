@resultBuilder
public struct HTMLBuilder {
    public static func buildBlock(_ components: any Node...) -> Fragment {
        return Fragment(components)
    }

    
    public static func buildOptional(_ block: Fragment?) -> any Node {
        block ?? None()
    }
    
    
    public static func buildEither(first block: Fragment) -> any Node {
        block
    }
    
    
    public static func buildEither(second block: Fragment) -> any Node {
        block
    }
    
    
    public static func buildExpression(_ expression: any Node) -> Node {
        expression
    }

    
    public static func buildExpression(_ expression: String) -> Text {
        Text(expression)
    }
}
