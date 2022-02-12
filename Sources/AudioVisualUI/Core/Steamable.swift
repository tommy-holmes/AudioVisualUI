public protocol Streamable {
    var asset: AVAsset { get }
    var title: String { get }
    var subtitle: String? { get }
}

public extension Streamable {
    var player: AVPlayer {
        .init(playerItem: AVPlayerItem(asset: asset))
    }
}
