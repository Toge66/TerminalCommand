// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "TerminalCommand",
    targets: [
        Target(name: "TerminalCommandKit", dependencies: []),
        Target(name: "TerminalCommand", dependencies: ["TerminalCommandKit"])
    ],
    dependencies: [
        .Package(url: "https://github.com/jatoben/CommandLine", "3.0.0-pre1"),
        .Package(url: "https://github.com/onevcat/Rainbow", majorVersion: 2),
        .Package(url: "https://github.com/kylef/PathKit", majorVersion: 0),
//        .Package(url: "https://github.com/kylef/Spectre", "0.7.2")
    ]
)
