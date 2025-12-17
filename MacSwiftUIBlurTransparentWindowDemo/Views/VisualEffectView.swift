//
//  VisualEffectView.swift
//  MacSwiftUIBlurTransparentWindowDemo
//
//  Created by MeowCat on 2025/12/13.
//

import SwiftUI

struct VisualEffectView: NSViewRepresentable {
    let blurRadius: CGFloat
    let saturationFactor: CGFloat
    let color: UInt32
    let tintColor: UInt32
    let tintMode: String
    
    func makeNSView(context: Context) -> BackdropView {
        let view = BackdropView()
        view.blendingMode = .behindWindow
        view.state = .active
        if let window = view.window {
            window.styleMask.insert(.fullSizeContentView)
            window.titlebarAppearsTransparent = true
        }
        return view
    }

    func updateNSView(_ view: BackdropView, context: Context) {
        view.blurRadius = blurRadius
        view.saturationFactor = saturationFactor
        view.effect = .init(
            NSColor(rgba: color),
            NSColor(rgba: tintColor),
            tintMode)
    }
}
