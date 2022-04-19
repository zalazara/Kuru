//
//  Kuru_ExampleApp.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 18/04/2022.
//

import SwiftUI
import Kuru

@main
struct Kuru_ExampleApp: App {
    init() {
        registerScreens()
        registerComponents()
        registerFunctions()
    }
    
    func registerScreens() {
        KNavigationManager.shared.register(screens: [
            KScreen(id: "first_view", isNavigationBarHidden: true),
            KScreen(id: "second_view", title: "Show navigation", isNavigationBarHidden: false)
        ])
    }
    
    func registerComponents() {
        Kuru.registerComponent(ScreenContainerComponent.self, for: "screenContainer")
        Kuru.registerComponent(AsyncImageViewComponent.self, for: "asyncImageView")
        Kuru.registerComponent(TitleTextComponent.self, for: "titleText")
        Kuru.registerComponent(SubtitleTextComponent.self, for: "subtitleText")
        Kuru.registerComponent(CircleIconButton.self, for: "circleIconButton")
        Kuru.registerComponent(NavigationViewComponent.self, for: "navigationView")
    }
    
    func registerFunctions() {
        Kuru.registerFunction(name: "sayHello", completion: { params in
            print("Hello \(params?["name"] ?? "" )")
        })
        
        Kuru.registerFunction(name: "navigateTo", completion: { params in
            guard let id = params?["id"] as? String else { return }
            
            KNavigationManager.shared.activeLink = id
            KNavigationManager.shared.activeScreen = KNavigationManager.shared.screens.first(where: { $0.id == id })
        })
    }
    
    var body: some Scene {
        WindowGroup {
            
            if let first = KNavigationManager.shared.screens.first, let id = first.id, let data = first.getData() {
                ContentView(viewId: id,data: data)
            } else {
                EmptyView().background(.white)
            }
        }
    }
}
