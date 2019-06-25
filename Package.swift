// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "PureMark",
  products: [
    .library(
      name: "PureMark",
      targets: ["PureMark"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "PureMark",
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
      name: "PureMarkTests",
      dependencies: ["PureMark"]),
  ]
)
