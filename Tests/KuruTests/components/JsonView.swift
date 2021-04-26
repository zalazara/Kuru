import SwiftUI
import Kuru

struct JsonView: KComponentProtocol {
    
    var width: CGFloat?
    var height: CGFloat?
    var backgroundColor: Color?
    
    func render(withChildrens: [AnyView]) -> AnyView {
        var body: some View {
            getView(childrens: withChildrens)
        }
        
        return body
            .background(backgroundColor)
            .toAnyView()
    }
    
    
    
    func getView(childrens:  [AnyView]) -> AnyView {
        
        let content =
            ForEach(0..<childrens.count) { index in
                childrens[index]
            }
        
        
        if let background = backgroundColor {
            return AnyView(ZStack(content: {
                background.edgesIgnoringSafeArea(.all)
                VStack(content: {
                    content
                })
            }))
        }
        
        return content.toAnyView()
    }
    
    
}
