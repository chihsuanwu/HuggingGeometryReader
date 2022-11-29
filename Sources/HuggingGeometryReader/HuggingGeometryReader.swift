import SwiftUI

@available(iOS 14, macOS 11, *)
public struct HuggingGeometryReader<Content: View>: View {

    @State private var size: CGSize = SizeKey.defaultValue

    private let content: (CGSize) -> Content
    
    public init(@ViewBuilder content: @escaping (CGSize) -> Content) {
        self.content = content
    }
    
    public var body: some View {
        content(size)
            .background(
                GeometryReader { proxy in
                    Color.clear.preference(key: SizeKey.self, value: proxy.size)
                }
            )
            .onPreferenceChange(SizeKey.self) { size = $0 }
    }
    
    private struct SizeKey: PreferenceKey {
        static var defaultValue: CGSize { CGSize() }
        static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
    }
}

@available(iOS 14, macOS 11, *)
struct HuggingGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        HuggingGeometryReader { size in
            Text("Hello, \(size.width), \(size.height))")
                .background(Color.green)
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}
