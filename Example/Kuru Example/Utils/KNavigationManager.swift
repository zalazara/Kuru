//
//  KNavigationManager.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 19/04/2022.
//

import Foundation

class KNavigationManager: ObservableObject {
    
    @Published var activeLink: String? = nil
    
    var screens: [KScreen] = [] {
        didSet {
            activeScreen = screens.first
        }
    }
    
    var activeScreen: KScreen?
    
    public static let shared = KNavigationManager()

    private init(){}
    
    
    func register(screen: KScreen) {
        self.screens.append(screen)
    }
    
    func register(screens: [KScreen]) {
        self.screens.append(contentsOf: screens)
    }
    
    
}
