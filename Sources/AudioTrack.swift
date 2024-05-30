#if canImport(MobileVLCKit)
import MobileVLCKit
#endif

#if canImport(TVVLCKit)
import TVVLCKit
#endif

public struct AudioTrack: Identifiable, Hashable, Codable, Sendable {
  public let id: Int32
  public let name: String

  public init(id: Int32, name: String) {
    self.id = id
    self.name = name
  }
}

extension VLCMediaPlayer {
  var audioTracks: [AudioTrack] {
    guard
      let ids = audioTrackIndexes as? [Int32],
      let names = audioTrackNames as? [String],
      ids.count == names.count
    else {
      return []
    }
    return zip(ids, names).map(AudioTrack.init)
  }

  var currentAudioTrackId: AudioTrack.ID? {
    get {
      currentAudioTrackIndex
    }
    set {
      let id = newValue ?? 0
      currentAudioTrackIndex = id
    }
  }
}
