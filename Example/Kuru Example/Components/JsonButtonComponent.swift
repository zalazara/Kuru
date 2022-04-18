//
//  JsonButtonComponent.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 18/04/2022.
//

import SwiftUI
import Kuru

struct JsonButtonComponent: KComponentProtocol {
    
    var width: CGFloat?
    var height: CGFloat?
    var alignment: KAlignment?
    var backgroundColor: Color?
    var text: String
    var textStyle: KTextStyle?
    var lineLimit: Int?
    var lineSpacing: Int?
    var textColor: Color?
    var strikethrough: Bool?
    var textAlignment: KTextAlignment?
    var action: KFunctionDecoder?
    
    func render(withChildrens: [AnyView]) -> AnyView {
        AnyView(
            Button(text, action: executeAction)
                .foregroundColor(textColor ?? Color.accentColor)
                .background(backgroundColor ?? Color.clear)
        )
    }
    
    func executeAction() {
        guard let action = action else {
            return
        }
        
        action()
    }
}
