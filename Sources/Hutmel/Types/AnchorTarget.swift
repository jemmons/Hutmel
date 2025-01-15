public enum AnchorTarget {
    case defaultSelf
    case blank
    case parent
    case top
    case unfencedTop
    case custom(String)
}



extension AnchorTarget: CustomStringConvertible {
    public var description: String {
        switch self {
        case .defaultSelf: return "_self"
        case .blank: return "_blank"
        case .parent: return "_parent"
        case .top: return "_top"
        case .unfencedTop: return "_unfencedTop"
        case let .custom(str): return str
        }
    }
}
