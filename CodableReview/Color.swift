//
//  Color.swift
//  CodableReview
//
//  Created by C4Q  on 11/16/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct ColorScheme: Codable {
    let mode: String
    let colors: [Color]
}

struct Color: Codable {
    let name: Name
    let hex: HexWrapper
    let rgb: RGBWrapper
}

struct Name: Codable {
    let value: String
}

struct HexWrapper: Codable {
    let clean: String
}

struct RGBWrapper: Codable {
    let fraction: FractionWrapper
}

struct FractionWrapper: Codable {
    let r: Double
    let g: Double
    let b: Double
}
