//
//  GlobalRouter.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-09.
//

import SwiftUI
import Routing
import ColorTokensKit

enum GlobalRouter: Routable {
    case colorRampView(LCHColor)
    
    @ViewBuilder
    func viewToDisplay(router: Router<GlobalRouter>) -> some View {
        switch self {
        case .colorRampView(let lchColor):
            ColorTokensGeneratorView(lchColor: lchColor)
        }
    }
    
    var navigationType: NavigationType {
        switch self {
        case .colorRampView:
            return .push
        }
    }
}

extension Router {
    static var mock: Router<Destination> {
        Router<Destination>(isPresented: .constant(nil))
    }
}
