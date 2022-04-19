//
//  CircleIconButton.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 18/04/2022.
//

import SwiftUI
import Kuru

struct CircleIconButton: KComponentProtocol {
    
    var backgroundColor: Color?
    var iconColor: Color?
    var action: KFunctionDecoder?
    
    func render(withChildrens: [AnyView]) -> AnyView {
        Button {
            guard let action = action else {
                return
            }
            
            action()

        } label: {
            Image(systemName: "arrow.right")
                .foregroundColor(iconColor)
                .padding()
                .background(backgroundColor)
                .clipShape(Circle())
        }.toAnyView()
    }
}
