//
//  SubtitleTextComponent.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 18/04/2022.
//

import SwiftUI
import Kuru

struct SubtitleTextComponent: KComponentProtocol {
    
    let text: String
    var textColor: Color?
    var width: CGFloat?
    
    func render(withChildrens: [AnyView]) -> AnyView {
        Text(text)
            .font(.title3)
            .foregroundColor(textColor ?? .black)
            .frame(width: width ?? .infinity)
            .toAnyView()
    }
}
