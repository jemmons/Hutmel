public protocol Node {
    var stringRepresentation: String { get }
    var children: [any Node] { get }
    
}
