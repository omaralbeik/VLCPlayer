import Foundation

#if canImport(MobileVLCKit)
import MobileVLCKit
#endif

#if canImport(TVVLCKit)
import TVVLCKit
#endif

public struct PlaybackSpeed: Identifiable, Hashable, Codable, Sendable {
  public let value: Float

  public var name: String {
    switch value {
    case 0.25:
      return "0.25x"
    case 0.50:
      return "0.5x"
    case 0.75:
      return "0.75x"
    case 1.00:
      return "1.0x"
    case 1.25:
      return "1.25x"
    case 1.50:
      return "1.5x"
    case 1.75:
      return "1.75x"
    case 2.00:
      return "2.0x"
    default:
      return "\(value.rounded())x"
    }
  }

  public var id: Float { value }
}

extension PlaybackSpeed: CaseIterable {
  public static var allCases: [Self] {
    [
      0.25,
      0.50,
      0.75,
      1.00,
      1.25,
      1.50,
      1.75,
      2.00
    ]
  }
}

extension PlaybackSpeed: ExpressibleByFloatLiteral {
  public init(floatLiteral value: Float) {
    self.value = value
  }
}

extension VLCMediaPlayer {
  var playbackSpeeds: [PlaybackSpeed] {
    isSeekable ? PlaybackSpeed.allCases : []
  }

  var currentPlaybackSpeedId: PlaybackSpeed.ID {
    get {
      rate
    }
    set {
      rate = newValue
    }
  }
}
