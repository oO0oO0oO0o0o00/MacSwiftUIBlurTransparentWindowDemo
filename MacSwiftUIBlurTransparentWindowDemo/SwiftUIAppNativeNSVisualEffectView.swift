import SwiftUI

//@main
fileprivate struct Window: App {
    var body: some Scene {
        WindowGroup {
            BlurredWindowContentView()
        }.windowStyle(.hiddenTitleBar)
    }
}

fileprivate struct BlurredWindowContentView: View {
    @State var value = 0
    
    var body: some View {
        VStack {
            Button {
                value = (value + 1) % materials.count
            } label: {
                let text = "\(value): \(materials[value])"
                Text(text)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(SimpleVisualEffectView(value: value).ignoresSafeArea())
    }
}

fileprivate struct SimpleVisualEffectView: NSViewRepresentable {
    let value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = BackdropView()
        view.blendingMode = .behindWindow
        view.state = .active
        if let window = view.window {
            window.styleMask.insert(.fullSizeContentView)
            window.titlebarAppearsTransparent = true
        }
        return view
    }

    func updateNSView(_ view: NSVisualEffectView, context: Context) {
        view.material = materials[value]
    }
}

fileprivate let materials: [NSVisualEffectView.Material] = [
//    .titlebar,
//    .selection,
    .menu, // ok
    .popover, // ok
//    .sidebar,
//    .headerView,
//    .sheet,
//    .windowBackground,
    .hudWindow, // best
    .fullScreenUI, // best
//    .toolTip,
//    .contentBackground,
//    .underWindowBackground,
//    .underPageBackground,
]
