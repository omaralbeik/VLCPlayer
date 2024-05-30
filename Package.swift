// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "VLCPlayer",
  platforms: [
    .iOS(.v14),
    .tvOS(.v14),
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
      ],
      path: "Sources",
      linkerSettings: [
        .linkedFramework("MobileVLCKit", .when(platforms: [.iOS])),
        .linkedFramework("TVVLCKit", .when(platforms: [.tvOS])),
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
  ]
)
