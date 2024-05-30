import Foundation

#if canImport(MobileVLCKit)
import MobileVLCKit
#endif

#if canImport(TVVLCKit)
import TVVLCKit
#endif

public struct Media: Hashable, Codable, Sendable {
  public let url: URL
  public let title: String?

  public init(url: URL, title: String? = nil) {
    self.url = url
    self.title = title
  }

  var vlc: VLCMedia {
    return VLCMedia(url: url)
  }
}
