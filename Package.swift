// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftMark",
  products: [
    .library(
      name: "SwiftMark",
      targets: ["SwiftMark"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "SwiftMark",
      dependencies: ["Lexer", "Parser", "Renderer"]
    ),
    .target(
      name: "Lexer",
      dependencies: []
    ),
    .target(
      name: "Renderer",
      dependencies: ["Parser"]
    ),
    .target(
      name: "Parser",
      dependencies: ["Lexer"]
    ),
    .testTarget(
      name: "SwiftMarkTests",
      dependencies: ["SwiftMark"]),
  ]
)
