import SwiftUI
struct PlaybackView: View {
    var media: Streamable
    
    var body: some View {
        PlayerView(media: media)
    }
}

struct PlayerView: UIViewControllerRepresentable {
    var media: Streamable
    
    func makeCoordinator() -> Coordinator {
        Coordinator(media: media)
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let avc = AVPlayerViewController()
        
        avc.player = context.coordinator.player
        
        return avc
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) { }
}

extension PlayerView {
    final class Coordinator: NSObject {
        init(media: Streamable) {
            self.media = media
            super.init()
        }
        
        var media: Streamable
        
        fileprivate var player: AVPlayer { AVPlayer(url: media.hlsUrl) }
    }
}

struct PlaybackView_Previews: PreviewProvider {
    private static let sampleVideo = Video(
        hlsUrl: URL(string: "https://devstreaming-cdn.apple.com/videos/wwdc/2018/103zvtnsrnrijr/103/hls_vod_mvp.m3u8")!,
        title: "Apple Design Awards",
        duration: 2946
    )
    
    static var previews: some View {
        PlaybackView(media: sampleVideo)
    }
}
