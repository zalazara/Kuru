//
//  AsyncImageViewComponent.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 18/04/2022.
//

import SwiftUI
import Kuru

struct AsyncImageViewComponent: KComponentProtocol {
    
    var url: String
    var width: CGFloat
    var height: CGFloat
    
    func render(withChildrens: [AnyView]) -> AnyView {
        AsyncImage(url: URL(string: url)){ image in
            image.resizable()
        } placeholder: {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .red))
        }
        .frame(width: width, height: height, alignment: .center)
        .scaledToFit()
        .toAnyView()
    }
}
