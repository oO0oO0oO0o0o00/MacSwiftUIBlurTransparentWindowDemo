//
//  Binding+Conversions.swift
//  MacSwiftUIBlurTransparentWindowDemo
//
//  Created by MeowCat on 2025/12/7.
//

import SwiftUI

extension Binding {
    static func convert<
        TFrom: BinaryFloatingPoint & Sendable,
        TTo: BinaryFloatingPoint
    >(
        _ floatBinding: Binding<TFrom>
    ) -> Binding<TTo> {
        Binding<TTo> (
            get: { TTo(floatBinding.wrappedValue) },
            set: { floatBinding.wrappedValue = TFrom($0) }
        )
    }
    
    static func convert<
        TInt: BinaryInteger & Sendable,
        TFloat: BinaryFloatingPoint
    >(_ intBinding: Binding<TInt>) -> Binding<TFloat> {
        Binding<TFloat> (
            get: { TFloat(intBinding.wrappedValue) },
            set: { intBinding.wrappedValue = TInt($0.rounded()) }
        )
    }

    static func convert<
        TFloat: BinaryFloatingPoint & Sendable,
        TInt: BinaryInteger
    >(
        _ floatBinding: Binding<TFloat>
    ) -> Binding<TInt> {
        Binding<TInt> (
            get: { TInt(floatBinding.wrappedValue) },
            set: { floatBinding.wrappedValue = TFloat($0) }
        )
    }
    
    static func intComponent<TInt: BinaryInteger>(
        from int: Binding<TInt>,
        offset: UInt8,
        mask: TInt
    ) -> Binding<TInt> {
        return Binding<TInt>(
            get: { (int.wrappedValue >> offset) & mask },
            set: {
                int.wrappedValue &= ~(mask << offset)
                int.wrappedValue |= ($0 & mask) << offset
            }
        )
    }
}
