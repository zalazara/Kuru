//
//  ContentView.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 18/04/2022.
//

import SwiftUI
import Kuru

struct ContentView: View {
    @StateObject var navigationManager = KNavigationManager.shared
    var viewData: Data
    var viewId: String
    
    init(viewId: String, data: Data) {
        self.viewId = viewId
        self.viewData = data
    }
    
    var body: some View {
        NavigationView {
            
            ZStack{
                let content = ForEach(0..<KNavigationManager.shared.screens.count, id:\.self) { index in
                    if let item = KNavigationManager.shared
                        .screens[index], let data = item.getData(), let id = item.id , id != self.viewId {
                        NavigationLink(destination: ContentView(viewId: id, data: data), tag: id, selection: $navigationManager.activeLink) { EmptyView()
                        }
                    } else {
                        EmptyView()
                    }
                }
                content
                Kuru.render(fromData: viewData)
            }
        }
        .navigationBarHidden(navigationManager.activeScreen?.isNavigationBarHidden ?? false)
        .navigationTitle(navigationManager.activeScreen?.title ?? "")
    }
}
