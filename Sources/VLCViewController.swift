import SwiftUI
import UIKit

#if os(iOS)
import MobileVLCKit
#endif

#if os(tvOS)
import TVVLCKit
#endif

@MainActor
final class VLCViewController: UIViewController {
  var media: Media
  var vlcMedia: VLCMedia
  var vlcMediaPlayer: VLCMediaPlayer

  required init(media: Media) {
    self.media = media
    self.vlcMedia = media.vlc

    vlcMediaPlayer = .init(options: ["--sub-margin=120", "--freetype-rel-fontsize=14"])
    vlcMediaPlayer.media = vlcMedia

    super.init(nibName: nil, bundle: nil)

    vlcMediaPlayer.delegate = self
    vlcMedia.delegate = self
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("Unimplemented")
  }

  deinit {
    vlcMediaPlayer.media = nil
  }

  let mediaPlayerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .black
    return view
  }()

  // MARK: - UIView lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(mediaPlayerView)
    NSLayoutConstraint.activate([
      mediaPlayerView.topAnchor.constraint(equalTo: view.topAnchor),
      mediaPlayerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      mediaPlayerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      mediaPlayerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])

    view.backgroundColor = .black
    vlcMediaPlayer.drawable = mediaPlayerView
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    vlcMediaPlayer.play()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }
}

// MARK: - VLCMediaPlayerDelegate

extension VLCViewController: VLCMediaPlayerDelegate {

}

// MARK: - VLCMediaDelegate

extension VLCViewController: VLCMediaDelegate {

}
