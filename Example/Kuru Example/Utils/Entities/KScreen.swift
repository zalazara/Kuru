//
//  KScreen.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 19/04/2022.
//

import Foundation

struct KScreen {
    let id: String
    let title: String?
    let isNavigationBarHidden: Bool
    
    init(id: String, title: String? = nil, isNavigationBarHidden: Bool = false){
        self.id = id
        self.title = title
        self.isNavigationBarHidden = isNavigationBarHidden
    }
    
    func getData() -> Data? {
        
        guard let path = Bundle.main.path(forResource: self.id, ofType: "json") , let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            return nil
        }
        
        return data
    }
}
