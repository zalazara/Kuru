//
//  TitleTextComponent.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 18/04/2022.
//

import SwiftUI
import Kuru

struct TitleTextComponent: KComponentProtocol {
    
    var text: String
    var textColor: Color?
    
    func render(withChildrens: [AnyView]) -> AnyView {
        Text(text)
            .font(Font.title)
            .fontWeight(.bold)
            .foregroundColor(textColor ?? .black)
            .toAnyView()
    }
}
