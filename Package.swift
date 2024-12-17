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
  ],
  targets: [
    .target(
      name: "Hutmel",
      dependencies: []),
    .testTarget(
      name: "HutmelTests",
      dependencies: ["Hutmel"]),
  ]
)
