//
//  ContentView.swift
//  Kuru Example
//
//  Created by Alejandro Zalazar on 18/04/2022.
//

import SwiftUI
import Kuru

struct ContentView: View {
    @State var viewData = Data()
    
    var body: some View {
        if viewData.isEmpty {
            Button("Render View", action: {
                if let path = Bundle.main.path(forResource: "first_view", ofType: "json") {
                    do {
                        viewData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                
            })
        } else {
            Kuru.render(fromData: viewData)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
