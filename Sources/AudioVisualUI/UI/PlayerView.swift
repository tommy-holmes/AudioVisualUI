import UIKit
import AVFoundation

internal struct PlayerView: UIViewRepresentable {
    var player: AVPlayer
    @Binding var isPlaying: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPlayerView {
        let playerView = UIPlayerView()
        playerView.player = player
        
        return playerView
    }
    
    func updateUIView(_ uiView: UIPlayerView, context: Context) {
        if isPlaying {
            context.coordinator.parent.player.play()
        } else {
            context.coordinator.parent.player.pause()
        }
    }
}

internal extension PlayerView {
    final class Coordinator: NSObject {
        var parent: PlayerView
        
        init(_ parent: PlayerView) {
            self.parent = parent
        }
    }
}

internal final class UIPlayerView: UIView {
    override class var layerClass: AnyClass { AVPlayerLayer.self }
    
    var player: AVPlayer? {
        get { playerLayer.player }
        set { playerLayer.player = newValue }
    }
    
    var playerLayer: AVPlayerLayer { layer as! AVPlayerLayer }
}
