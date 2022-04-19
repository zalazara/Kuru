//
//  NavigationViewComponent.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 19/04/2022.
//

import SwiftUI
import Kuru

struct NavigationViewComponent: KComponentProtocol {
    
    var title: String?
    var barHidden: Bool?
    
    func render(withChildrens: [AnyView]) -> AnyView {
        NavigationView {
            let content = ForEach(0..<withChildrens.count, id:\.self) { index in
                withChildrens[index]
            }
            
            content
        }
        .navigationTitle(title ?? "")
        .navigationBarHidden(barHidden ?? false)
        .toAnyView()
    }
}
