import SwiftUI

@available(iOS 14, macOS 11, *)
public struct VerticalGeometryReader<Content: View>: View {
    
    private let onChange: ((CGFloat) -> ())?
    private let content: (CGFloat) -> Content
    
    public init(onChange: ((CGFloat) -> ())? = nil, @ViewBuilder content: @escaping (CGFloat) -> Content) {
        self.onChange = onChange
        self.content = content
    }
    
    public var body: some View {
        HuggingGeometryReader(onChange: {
            onChange?($0.height)
        }) { size in
            content(size.height)
                .frame(maxHeight: .infinity)
        }
    }
}

@available(iOS 14, macOS 11, *)
struct VerticalGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        VerticalGeometryReader { height in
            VStack(spacing: 0) {
                Text("Hello")
                    .padding()
                    .frame(height: height * 0.25)
                    .background(Color.red)
                
                Text("SwiftUI")
                    .padding()
                    .frame(height: height * 0.75)
                    .background(Color.blue)
            }
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
    }
}

