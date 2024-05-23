import SwiftUI

#if canImport(MobileVLCKit)
import MobileVLCKit
#endif

#if canImport(VLCKit)
import VLCKit
#endif

#if canImport(TVVLCKit)
import TVVLCKit
#endif

#if os(iOS) || os(tvOS)
public struct VideoPlayerView: UIViewControllerRepresentable {
  let url: URL

  public init(url: URL) {
    self.url = url
  }

  public func makeUIViewController(context: Context) -> UIViewController {
    let viewController = UIViewController()

#if canImport(MobileVLCKit)
    let mediaPlayer = VLCMediaPlayer()
    let media = VLCMedia(url: url)
    mediaPlayer.media = media
    let videoView = UIView(frame: viewController.view.bounds)
    videoView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    viewController.view.addSubview(videoView)
    mediaPlayer.drawable = videoView
    mediaPlayer.play()
#elseif canImport(TVVLCKit)
    let mediaPlayer = VLCMediaPlayer()
    let media = VLCMedia(url: url)
    mediaPlayer.media = media
    let videoView = UIView(frame: viewController.view.bounds)
    videoView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    viewController.view.addSubview(videoView)
    mediaPlayer.drawable = videoView
    mediaPlayer.play()
#endif

    return viewController
  }

  public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
#elseif os(macOS)
public struct VideoPlayerView: NSViewRepresentable {
  let url: URL

  public init(url: URL) {
    self.url = url
  }

  public func makeNSView(context: Context) -> NSView {
    let view = NSView(frame: .zero)

#if canImport(VLCKit)
    let mediaPlayer = VLCMediaPlayer()
    let media = VLCMedia(url: url)
    mediaPlayer.media = media
    mediaPlayer.drawable = view
    mediaPlayer.play()
#endif

    return view
  }

  public func updateNSView(_ nsView: NSView, context: Context) {}
}
#endif
