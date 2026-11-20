// swift-tools-version:5.9
import PackageDescription

// The product keeps the adapter's name. The binary's module (BidmadPangleAdapter) is what
// BidmadSDK looks up at runtime. BidmadPangleAdapterLoader carries the dependencies a binary
// target cannot declare, plus generated class references that keep a static
// adapter's classes linked.
//
// Versions: 7.2.x works with BidmadSDK 7.2.x. The part after "+" is the
// Pangle (AdsGlobalPackage) version this build pins.
let package = Package(
  name: "BidmadPangleAdapter",
  platforms: [.iOS(.v15)],
  products: [
    .library(name: "BidmadPangleAdapter", targets: ["BidmadPangleAdapterLoader"]),
  ],
  dependencies: [
    .package(url: "https://github.com/bidmad/BidmadSDK-SPM.git", .upToNextMinor(from: "7.2.0-dev.2")),
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
      url: "https://github.com/bidmad/BidmadPangleAdapter-SPM/releases/download/7.2.0-dev.2+7.9.0.8/BidmadPangleAdapter.xcframework.zip",
      checksum: "a81d8557edfa29f2b53d04bb9683bebc0d9383072ad1ead343307c07342672b6"
    ),
  ]
)
