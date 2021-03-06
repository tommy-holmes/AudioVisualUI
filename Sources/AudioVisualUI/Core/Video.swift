import AVFoundation
public struct Video: Streamable {
    public var asset: AVAsset
    public var title: String
    public var subtitle: String?
}

internal extension Video {
    static let sample = Self(
        asset: AVAsset(url: URL(string: "https://devstreaming-cdn.apple.com/videos/wwdc/2018/103zvtnsrnrijr/103/hls_vod_mvp.m3u8")!),
        title: "Apple Design Awards",
        subtitle: "Subtitle"
    )
}
