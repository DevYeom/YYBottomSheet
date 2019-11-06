// swift-tools-version:5.0
//
//  Package.swift
//  SwiftPM
//
//  Created by DevYeom on 2019/11/01.
//

import PackageDescription

let package = Package(
    name: "YYBottomSheet",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "YYBottomSheet",
                 targets: ["YYBottomSheet"])
    ],
    targets: [
        .target(name: "YYBottomSheet",
                path: "YYBottomSheet/Classes")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
