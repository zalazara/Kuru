//
//  JsonTextComponent.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 18/04/2022.
//

import SwiftUI
import Kuru

struct JsonTextComponent: KComponentProtocol {
    var backgroundColor: Color?
    var alignment: KAlignment?
    var width: CGFloat?
    var height: CGFloat?
    var text: String
    var textStyle: KTextStyle?
    var lineLimit: Int?
    var lineSpacing: Int?
    var textColor: Color?
    var strikethrough: Bool?
    var textAlignment: KTextAlignment?
    
    func render(withChildrens: [AnyView]) -> AnyView {
        return  AnyView(
            generateTextWithProperties()
        )
    }
    
    private func generateTextWithProperties() -> some View {
        
        let txtComponent = Text(self.text)
        
        var txtAlignment: TextAlignment
        
        switch textAlignment {
        case .leading:
            txtAlignment = .leading
        case .trailing:
            txtAlignment = .trailing
        default:
            txtAlignment = .center
        }
        
        
        return txtComponent
            .foregroundColor(textColor)
            .multilineTextAlignment(txtAlignment)
            .lineLimit(lineLimit)
            .background(backgroundColor ?? Color.clear)
    }
    
}
