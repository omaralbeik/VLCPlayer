import SwiftUI

#if canImport(MobileVLCKit)
import MobileVLCKit
#endif

#if canImport(TVVLCKit)
import TVVLCKit
#endif

public struct PlayerView: View {
  public let media: Media

  public init(media: Media) {
    self.media = media
  }

  public var body: some View {
    VLCLayer(media: media)
  }
}
