//
//  JsonViewComponent.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 18/04/2022.
//
import SwiftUI
import Kuru

struct JsonViewComponent: KComponentProtocol {
    
    var backgroundColor: Color? // Color+Codable extension is available in Kuru library
    var width: CGFloat?
    var height: CGFloat?
    
    func render(withChildrens: [AnyView]) -> AnyView {
        var body: some View {
            ZStack{
                backgroundColor
                VStack {
                    getView(childrens: withChildrens)
                }
            }
        }
        
        return body
            .frame(width: self.width, height: self.height, alignment: .center)
            .toAnyView()
    }
    
    
    
    func getView(childrens:  [AnyView]) -> AnyView {
        
        // Render childrens components inside
        let content =
        ForEach(0..<childrens.count) { index in
            childrens[index]
        }
        
        return content.toAnyView() // View+ToAnyView extension is available in Kuru library
    }
    
    
}
