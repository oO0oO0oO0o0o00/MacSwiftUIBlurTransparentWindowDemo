//
//  Color+Int.swift
//  KittenalLen
//
//  Created by MeowCat on 2025/11/30.
//

import AppKit

extension NSColor {
    var int: UInt32 {
        guard let converted = usingColorSpace(.sRGB) else { return 0 }
        return UInt32((converted.redComponent * 255).rounded()) << 24 |
            UInt32((converted.greenComponent * 255).rounded()) << 16 |
            UInt32((converted.blueComponent * 255).rounded()) << 8 |
            UInt32((converted.alphaComponent * 255).rounded())
    }

    convenience init(rgba int: UInt32) {
        self.init(
            red: (int >> 24) & 0xff,
            green: (int >> 16) & 0xff,
            blue: (int >> 8) & 0xff,
            alpha: int & 0xff)
    }

    convenience init<TInt: BinaryInteger>(
        red: TInt,
        green: TInt,
        blue: TInt,
        alpha: TInt
    ) {
        self.init(
            red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: CGFloat(alpha) / 255
        )
    }
}
