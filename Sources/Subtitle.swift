#if canImport(MobileVLCKit)
import MobileVLCKit
#endif

#if canImport(TVVLCKit)
import TVVLCKit
#endif

public struct Subtitle: Identifiable, Hashable, Codable, Sendable {
  public let id: Int32
  public let name: String

  public init(id: Int32, name: String) {
    self.id = id
    self.name = name
  }
}

extension VLCMediaPlayer {
  var subtitles: [Subtitle] {
    guard
      let ids = videoSubTitlesIndexes as? [Int32],
      let names = videoSubTitlesNames as? [String],
      ids.count == names.count
    else {
      return []
    }
    return zip(ids, names).map(Subtitle.init)
  }

  var currentSubtitleId: Subtitle.ID? {
    get {
      currentVideoSubTitleIndex
    }
    set {
      let id = newValue ?? -1
      currentVideoSubTitleIndex = id
    }
  }
}
