public extension Build {
    static func fragment(@HTMLBuilder content: () -> Fragment) -> Fragment {
        content()
    }
}
