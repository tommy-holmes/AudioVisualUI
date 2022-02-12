import UIKit

public struct Audio: Streamable {
    public var asset: AVAsset
    public var title: String
    public var subtitle: String?
    public var image: UIImage?
}

internal extension Audio {
    static let sample: Self = .init(
        asset: AVAsset(url: URL(string: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")!),
        title: "This Love",
        subtitle: "Maroon 5"
    )
}
