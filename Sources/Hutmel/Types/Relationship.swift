public enum Relationship {
    case alternate
    case author
    case bookmark
    case canonical
    case dnsPrefetch
    case external
    case expect
    case help
    case icon
    case license
    case manifest
    case me
    case modulepreload
    case next
    case nofollow
    case noopener
    case noreferrer
    case opener
    case pingback
    case preconnect
    case prefetch
    case preload
    case prerender
    case prev
    case privacyPolicy
    case search
    case stylesheet
    case tag
    case termsOfService
    case other(String)
}


extension Relationship: CustomStringConvertible {
    public var description: String {
        switch self {
        case .alternate: return "alternate"
        case .author: return "author"
        case .bookmark: return "bookmark"
        case .canonical: return "canonical"
        case .dnsPrefetch: return "dns-prefetch"
        case .external: return "external"
        case .expect: return "expect"
        case .help: return "help"
        case .icon: return "icon"
        case .license: return "license"
        case .manifest: return "manifest"
        case .me: return "me"
        case .modulepreload: return "modulepreload"
        case .next: return "next"
        case .nofollow: return "nofollow"
        case .noopener: return "noopener"
        case .noreferrer: return "noreferrer"
        case .opener: return "opener"
        case .pingback: return "pingback"
        case .preconnect: return "preconnect"
        case .prefetch: return "prefetch"
        case .preload: return "preload"
        case .prerender: return "prerender"
        case .prev: return "prev"
        case .privacyPolicy: return "privacy-policy"
        case .search: return "search"
        case .stylesheet: return "stylesheet"
        case .tag: return "tag"
        case .termsOfService: return "terms-of-service"
        case let .other(str): return str
        }
    }
}
