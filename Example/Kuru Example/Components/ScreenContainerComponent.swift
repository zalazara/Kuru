//
//  ScreenContainerComponent.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 18/04/2022.
//

import Kuru
import SwiftUI

struct ScreenContainerComponent: KComponentProtocol {
    
    var backgroundColor: Color?
    var orientation: KViewOrientationStyle
    var spacing: CGFloat?
    
    func render(withChildrens: [AnyView]) -> AnyView {
        getContainerView(childrens: withChildrens)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(backgroundColor)
            .edgesIgnoringSafeArea(.all)
            .toAnyView()
    }
    
    @ViewBuilder
    func getContainerView(childrens: [AnyView]) -> some View {
        switch orientation {
        case .horizontal:
            HStack(spacing: spacing, content: {
                drawSubViews(views: childrens)
            })
        case .vertical:
            
            VStack(spacing: spacing, content: {
                drawSubViews(views: childrens)
            })
        case .absolute:
            ZStack {
                drawSubViews(views: childrens)
            }
        }
    }
    
    func drawSubViews(views: [AnyView]) -> AnyView {
        let content = ForEach(0..<views.count, id:\.self) { index in
            views[index]
        }
        
        return content.toAnyView()
    }
}
