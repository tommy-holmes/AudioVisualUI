struct PlayerView: UIViewControllerRepresentable {
    var item: AVPlayerItem
    var autoPlay: Bool = false
    
    func makeCoordinator() -> Coordinator {
        Coordinator(item: item)
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let avc = AVPlayerViewController()
        
        avc.player = context.coordinator.player
        if autoPlay { avc.player?.play() }
        
        return avc
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) { }
}

extension PlayerView {
    final class Coordinator: NSObject, AVPlayerViewControllerDelegate {
        init(item: AVPlayerItem) {
            self.item = item
            super.init()
        }
        
        var item: AVPlayerItem
        
        fileprivate var player: AVPlayer { AVPlayer(playerItem: item) }
    }
}
