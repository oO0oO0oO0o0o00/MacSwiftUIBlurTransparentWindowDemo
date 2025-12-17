//
//  ColorView.swift
//  KittenalLen
//
//  Created by MeowCat on 2025/11/30.
//

import SwiftUI

struct ColorView: View {
    let color: NSColor
    
    var body: some View {
        Rectangle()
            .fill(Color(nsColor: color))
            .frame(width: 48, height: 24)
            .cornerRadius(4)
    }
}
