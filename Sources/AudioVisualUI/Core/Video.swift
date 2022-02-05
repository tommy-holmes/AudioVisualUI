protocol Streamable {
    var hlsUrl: URL { get }
    var duration: TimeInterval { get }
    var resumeTime: TimeInterval { get set }
}

struct Video: Streamable {
    var hlsUrl: URL
    var title: String
    var duration: TimeInterval
    var resumeTime: TimeInterval = 0
}
