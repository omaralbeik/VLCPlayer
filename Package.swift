// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "VLCPlayer",
  platforms: [
    .iOS(.v14),
    .tvOS(.v14),
    .macOS(.v12),
  ],
  products: [
    .library(
      name: "VLCPlayer",
      targets: [
        "VLCPlayer",
      ]
    ),
  ],
  targets: [
    .target(
      name: "VLCPlayer",
      dependencies: [
        .target(name: "MobileVLCKit", condition: .when(platforms: [.iOS])),
        .target(name: "TVVLCKit", condition: .when(platforms: [.tvOS])),
        .target(name: "VLCKit", condition: .when(platforms: [.macOS])),
      ],
      path: "Sources",
      linkerSettings: [
        .linkedFramework("MobileVLCKit", .when(platforms: [.iOS])),
        .linkedFramework("TVVLCKit", .when(platforms: [.tvOS])),
        .linkedFramework("VLCKit", .when(platforms: [.macOS])),
      ]
    ),
    .binaryTarget(
      name: "MobileVLCKit",
      url: "https://github.com/omaralbeik/VLC/releases/download/3.5.1/MobileVLCKit.zip",
      checksum: "fee9ecd8df2929b012625435eecc041a1466cd0b20ec06b55fb9750d4d135f9c"
    ),
    .binaryTarget(
      name: "TVVLCKit",
      url: "https://github.com/omaralbeik/VLC/releases/download/3.5.1/TVVLCKit.zip",
      checksum: "f83a40003464cd4c68f1ec138bbcda685267371d85c06df3c3495abfdff7919e"
    ),
    .binaryTarget(
      name: "VLCKit",
      url: "https://github.com/omaralbeik/VLC/releases/download/3.5.1/VLCKit.zip",
      checksum: "fc184fd4fd4dc8543c3e06324f2afcc2f598e043f9ec0c286e57006249ddb848"
    ),
  ]
)
