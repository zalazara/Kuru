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
        
        Kuru.registerComponent(JsonViewComponent.self, for: "view")
        Kuru.registerComponent(JsonTextComponent.self, for: "text")
        Kuru.registerComponent(JsonButtonComponent.self, for: "button")
        
        Kuru.registerFunction(name: "sayHello", completion: { params in
            print("Hello \(params?["name"] ?? "" )")
        })
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
