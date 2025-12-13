//
//  View+Map.swift
//  MacSwiftUIBlurTransparentWindowDemo
//
//  Created by MeowCat on 2025/12/7.
//

import SwiftUI

extension View {
    @ViewBuilder
    func map<C: View>(
        if condition: @autoclosure () -> Bool,
        @ViewBuilder content: (Self) -> C
    ) -> some View {
        if condition() {
            content(self)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func mapOptional<U, C: View>(
        optionalValue: U?,
        @ViewBuilder content: (U) -> C
    ) -> some View {
        if let value = optionalValue {
            content(value)
        } else {
            self
        }
    }
}
