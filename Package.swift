// swift-tools-version:5.9
import PackageDescription

// The product keeps the adapter's name. The binary's module (BidmadPangleAdapter) is what
// BidmadSDK looks up at runtime. BidmadPangleAdapterLoader carries the dependencies a binary
// target cannot declare, plus generated class references that keep a static
// adapter's classes linked.
let package = Package(
  name: "BidmadPangleAdapter",
  platforms: [.iOS(.v15)],
  products: [
    .library(name: "BidmadPangleAdapter", targets: ["BidmadPangleAdapterLoader"]),
  ],
  dependencies: [
    .package(url: "https://github.com/bidmad/BidmadSDK-SPM.git", .upToNextMinor(from: "7.2.0-dev.1")),
    .package(url: "https://github.com/bytedance/AdsGlobalPackage.git", exact: "7.9.0-release.8"),
  ],
  targets: [
    .target(
      name: "BidmadPangleAdapterLoader",
      dependencies: [
        "BidmadPangleAdapter",
        .product(name: "BidmadSDK", package: "BidmadSDK-SPM"),
        .product(name: "AdsGlobalPackage", package: "AdsGlobalPackage"),
      ]
    ),
    .binaryTarget(
      name: "BidmadPangleAdapter",
      url: "https://github.com/bidmad/BidmadPangleAdapter-SPM/releases/download/7.9.0081600-dev.1/BidmadPangleAdapter.xcframework.zip",
      checksum: "4870a81347d7e7e74d6b60b57e02bf272adb6ede2697b77258fcb3d3b1685c4f"
    ),
  ]
)
