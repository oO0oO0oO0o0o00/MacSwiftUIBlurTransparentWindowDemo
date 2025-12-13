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
    @State var blurRadius: CGFloat = 5
    @State var saturationFactor: CGFloat = 1
    @State var effect: String = BackdropView.Effect.builtins[0].name
    
    var body: some View {
        ZStack {
            VStack {
                EnterableSlider(
                    value: .convert($blurRadius),
                    range: 0...20)
                EnterableSlider(
                    value: .convert($saturationFactor),
                    range: 0...2)
                HStack {
                    ForEach(BackdropView.Effect.builtins, id: \.name) { item in
                        Button {
                            effect = item.name
                        } label: {
                            Text(item.name)
                                .map(
                                    if: effect == item.name) {
                                        $0.foregroundStyle(.tint)
                                    }
                            
                        }
                    }
                }
                Spacer()
            }
        }
        .padding()
        .background(HighlightingView {
            VisualEffectView(
                blurRadius: blurRadius,
                saturationFactor: saturationFactor,
                effect: effect)
        }.ignoresSafeArea())
    }
}

#Preview {
    BlurredWindowContentView()
}
