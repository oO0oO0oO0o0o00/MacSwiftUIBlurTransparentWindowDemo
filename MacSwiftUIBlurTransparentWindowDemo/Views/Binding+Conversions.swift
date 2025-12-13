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
}
