import SwiftUI

public struct MediaBar: View {
    @State var item: Streamable
    
    private var playerItem: AVPlayerItem {
        AVPlayerItem(asset: item.asset)
    }
    
    public var body: some View {
        VStack {
            HStack {
                if item is Video {
                    PlayerView(item: playerItem, autoPlay: false) // Change to `true`
                } else if item is Audio {
                    
                }
                
                VStack {
                    Text(item.title)
                }
                
                Button {
                    // Play/pause
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(.primary)
                        
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                    }
                }
                .padding(.vertical)
                .disabled(playerItem.status != .readyToPlay)
            }
            .frame(maxHeight: 80)
        }
    }
}

internal struct MediaBar_Previews: PreviewProvider {
//    static let testImage = await UIImage.load(from: URL(string: "https://upload.wikimedia.org/wikipedia/en/b/be/Maroon_5_-_Songs_About_Jane.png")!)
    
    static var previews: some View {
        MediaBar(item: Video.sample)
            .previewLayout(.sizeThatFits)
    }
}
