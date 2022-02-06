struct PlaybackView: View {
    var media: Streamable
    
    private var playerItem: AVPlayerItem {
        AVPlayerItem(asset: media.asset)
    }
    
    var body: some View {
        PlayerView(item: playerItem)
    }
}

struct PlaybackView_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackView(media: Video.sample)
    }
}
