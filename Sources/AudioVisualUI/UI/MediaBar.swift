import SwiftUI

public struct MediaBar: View {
    @State var item: Streamable
    @State private var isPlaying: Bool = false
    
    private var playerItem: AVPlayerItem {
        AVPlayerItem(asset: item.asset)
    }
    
    public var body: some View {
        VStack {
            HStack {
                if item is Video {
                    PlayerView(player: AVPlayer(playerItem: playerItem), isPlaying: $isPlaying)
                } else if item is Audio {
                    AsyncImage(
                        url: URL(string: "https://upload.wikimedia.org/wikipedia/en/b/be/Maroon_5_-_Songs_About_Jane.png")!
                    ) { image in
                        image
                            .resizable()
                    } placeholder: {
                        Color.red
                    }
                    .frame(width: 96, height: 96, alignment: .leading)
                }
                
                VStack(alignment: .leading) {
                    Text(item.title)
                    
                    if let subtitle = item.subtitle {
                        Text(subtitle)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                Button {
                    isPlaying.toggle()
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(.primary)
                        
                        Image(systemName: isPlaying ? "pause" : "play.fill")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .frame(width: 96, height: 96, alignment: .trailing)
//                .disabled(playerItem.status != .readyToPlay)
            }
            .frame(maxHeight: 80)
        }
    }
}

internal struct MediaBar_Previews: PreviewProvider {
    static var previews: some View {
        MediaBar(item: Video.sample)
            .previewLayout(.sizeThatFits)
    }
}
