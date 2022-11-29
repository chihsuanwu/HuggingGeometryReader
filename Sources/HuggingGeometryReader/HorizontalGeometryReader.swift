import SwiftUI

@available(iOS 14, macOS 11, *)
public struct HorizontalGeometryReader<Content: View>: View {
    
    private let content: (CGFloat) -> Content
    
    public init(@ViewBuilder content: @escaping (CGFloat) -> Content) {
        self.content = content
    }
    
    public var body: some View {
        HuggingGeometryReader { size in
            content(size.width)
                .frame(maxWidth: .infinity)
        }
    }
}

@available(iOS 14, macOS 11, *)
struct HorizontalGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalGeometryReader { width in
            HStack(spacing: 0) {
                Text("Hello")
                    .padding()
                    .frame(width: width * 0.25)
                    .background(Color.red)
                
                Text("SwiftUI")
                    .padding()
                    .frame(width: width * 0.75)
                    .background(Color.blue)
            }
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}
