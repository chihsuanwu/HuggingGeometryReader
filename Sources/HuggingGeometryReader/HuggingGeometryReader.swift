import SwiftUI

/// A GeometryReader that has hugging sizing behavior.
@available(iOS 14, macOS 11, *)
public struct HuggingGeometryReader<Content: View>: View {

    @State private var size: CGSize = SizeKey.defaultValue
    
    private let onChange: ((CGSize) -> ())?
    private let content: (CGSize) -> Content
    
    public init(onChange: ((CGSize) -> ())? = nil, @ViewBuilder content: @escaping (CGSize) -> Content) {
        self.onChange = onChange
        self.content = content
    }
    
    public var body: some View {
        content(size)
            .background(
                GeometryReader { proxy in
                    Color.clear.preference(key: SizeKey.self, value: proxy.size)
                }
            )
            .onPreferenceChange(SizeKey.self) {
                size = $0
                onChange?($0)
            }
    }
    
    private struct SizeKey: PreferenceKey {
        static var defaultValue: CGSize { CGSize() }
        static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
    }
}

@available(iOS 14, macOS 11, *)
struct HuggingGeometryReader_Previews: PreviewProvider {
    
    static var previews: some View {
        Preview()
    }
    
    struct Preview: View {
        
        @State private var secondSize: CGSize = CGSize()
        
        var body: some View {
            VStack(spacing: 10) {
                HuggingGeometryReader { size in
                    Text("Hello, height is \(size.height)")
                        .padding()
                        .background(Color.green)
                }
                HuggingGeometryReader(onChange: {
                    secondSize = $0
                }) { size in
                    Text("Hello, Second Text")
                        .padding()
                        .background(Color.yellow)
                }
                
                Text("Second Text's size is \(secondSize.width), \(secondSize.height)")
            }
            .background(Color.red)
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
        }
    }
}
