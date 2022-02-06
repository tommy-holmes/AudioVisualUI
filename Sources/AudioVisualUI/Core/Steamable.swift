public protocol Streamable {
    var asset: AVAsset { get }
    var title: String { get }
    var duration: TimeInterval { get }
    var resumeTime: TimeInterval { get set }
}
