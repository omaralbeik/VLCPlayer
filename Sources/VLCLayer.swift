import SwiftUI

#if canImport(MobileVLCKit)
import MobileVLCKit
#endif

#if canImport(TVVLCKit)
import TVVLCKit
#endif

import SwiftUI
import UIKit

struct VLCLayer {
  let media: Media
}

extension VLCLayer: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> VLCViewController {
    let viewController = VLCViewController(media: media)
    viewController.modalPresentationStyle = .fullScreen
    return viewController
  }

  func updateUIViewController(_ uiViewController: VLCViewController, context: Context) {}
}
