import SwiftUI

@main
fileprivate struct Window: App {
    var body: some Scene {
        WindowGroup {
            BlurredWindowContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.windowStyle(.hiddenTitleBar)
    }
}

fileprivate struct BlurredWindowContentView: View {
    @State var color: UInt32 = 0xbbbbbb40
    
    @State var tintColor: UInt32 = 0x00000080
    
    @State var blurRadius: CGFloat = 5
    
    @State var saturationFactor: CGFloat = 1
    
    @State var tintMode: TintMode = TintMode.normal
    
    var body: some View {
        ZStack {
            VStack {
                Grid {
                    GridRow {
                        Text("Blur Radius")
                        EnterableSlider(
                            value: .convert($blurRadius),
                            range: 0...20)
                    }
                    GridRow {
                        Text("Saturation Factor")
                        EnterableSlider(
                            value: .convert($saturationFactor),
                            range: 0...2)
                    }
                }
                colorSettings(for: color, binding: $color)
                colorSettings(for: tintColor, binding: $tintColor)
                Picker("Tint Mode", selection: $tintMode) {
                    ForEach(TintMode.allCases) {
                        Text($0.rawValue).tag($0)
                    }
                }.pickerStyle(.segmented)
                Spacer()
            }
        }
        .padding()
        .background(HighlightingView {
            VisualEffectView(
                blurRadius: blurRadius,
                saturationFactor: saturationFactor,
                color: color,
                tintColor: tintColor,
                tintMode: tintMode.value)
        }.ignoresSafeArea())
    }
    
    @ViewBuilder
    func colorSettings(
        for color: UInt32,
        binding: Binding<UInt32>
    ) -> some View {
        Grid {
            ForEach([
                (name: "Red", offset: 24 as UInt8),
                (name: "Green", offset: 16),
                (name: "Blue", offset: 8),
                (name: "Alpha", offset: 0),
            ], id: \.name) { component in
                GridRow {
                    Text(component.name)
                    EnterableSlider(
                        value: .convert(Binding<UInt>.intComponent(
                            from: binding,
                            offset: component.offset,
                            mask: 0xff
                        )), range: 0...(component.offset == 0 ? 220 : 255),
                        step: 1)
                }
            }
        }
        HStack {
            Text("BG Color: \(String(format: "%08X", color))")
                .font(.body.monospaced())
            ColorView(color: .init(rgba: color))
        }
    }
}

#Preview {
    BlurredWindowContentView()
}
