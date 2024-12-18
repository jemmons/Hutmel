@resultBuilder
public struct HTMLBuilder {
    public static func buildBlock(_ components: any Node...) -> [any Node] {
        return components
    }
    
    public static func buildExpression(_ expression: some Node) -> Node {
        return expression
    }
    
//    public static func buildExpression(_ expression: Tag) -> any Node {
//        return expression
//    }
    
    public static func buildExpression(_ expression: String) -> Text {
        return Text(expression)
    }
}
