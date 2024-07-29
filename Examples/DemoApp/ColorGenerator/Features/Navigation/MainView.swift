//
//  MainView.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-09.
//

import SwiftUI
import Routing

struct MainView: View {
    @StateObject var router: Router<GlobalRouter>
    
    init(router: Router<GlobalRouter>) {
        _router = StateObject(wrappedValue: router)
    }
    
    var body: some View {
        tabStructure
    }
             
    private var tabStructure: some View {
        TabView {
            RoutingView(GlobalRouter.self) { router in
                HuesView(router: router)
            }
            .tabItem {
                Label("All Colors", systemImage: "paintpalette")
            }
            
            
            RoutingView(GlobalRouter.self) { router in
                ColorTokensGeneratorView(lchColor: Color.proLime)
            }
            .tabItem {
                Label("Playground", systemImage: "paintbrush")
            }
        }
    }
}

#Preview {
    MainView(router: .mock)
}
