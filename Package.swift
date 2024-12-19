// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Hutmel",
  products: [
    .library(
      name: "Hutmel",
      targets: ["Hutmel"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-algorithms", from: "1.2.0"),
  ],
  targets: [
    .target(
      name: "Hutmel",
      dependencies: [
        .product(name: "Algorithms", package: "swift-algorithms"),
      ]),
    .testTarget(
      name: "HutmelTests",
      dependencies: ["Hutmel"]),
  ]
)
