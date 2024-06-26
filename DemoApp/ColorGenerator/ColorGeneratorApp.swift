//
//  ColorGeneratorApp.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-08.
//

import SwiftUI
import Routing

@main
struct ColorGeneratorApp: App {
    var body: some Scene {
        WindowGroup {
            RoutingView(GlobalRouter.self) { router in
                MainView(router: router)
            }
        }
    }
}
