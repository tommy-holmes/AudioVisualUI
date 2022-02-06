import UIKit

public struct Audio: Streamable {
    public var asset: AVAsset
    public var title: String
    public var image: UIImage?
    public var duration: TimeInterval
    public var resumeTime: TimeInterval = 0
}
