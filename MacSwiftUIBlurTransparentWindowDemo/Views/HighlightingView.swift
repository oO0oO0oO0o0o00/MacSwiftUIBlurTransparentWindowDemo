//
//  HighlightingView.swift
//  MacSwiftUIBlurTransparentWindowDemo
//
//  Created by MeowCat on 2025/12/13.
//
// Source - https://stackoverflow.com/a/75263911
// Posted by rob mayoff
// Retrieved 2025-12-07, License - CC BY-SA 4.0

import SwiftUI

struct HighlightingView<C: View>: View {
    @Namespace private var namespace
    
    var content: C
    
    init(@ViewBuilder builder: () -> C) {
        content = builder()
    }

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Circle()
                    .foregroundStyle(.clear)
                    .matchedGeometryEffect(
                        id: 2333, in: namespace,
                        properties: .frame, anchor: .center,
                        isSource: true)
            }
            .padding(20)
            ZStack {
                content
                Circle()
                    .foregroundColor(.white)
                    .blur(radius: 30)
//                    .padding(-30)
                    .matchedGeometryEffect(
                        id: 2333, in: namespace,
                        properties: .frame, anchor: .center,
                        isSource: false
                    )
                    .blendMode(.destinationOut)
            }
            .compositingGroup()
        }
    }
}
