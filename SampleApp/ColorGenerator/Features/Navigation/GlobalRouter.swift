//
//  GlobalRouter.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-09.
//

import ColorTokensKit
import Routing
import SwiftUI

enum GlobalRouter: Routable {
    case colorRampView(LCHColor)

    @ViewBuilder
    func viewToDisplay(router _: Router<GlobalRouter>) -> some View {
        switch self {
        case let .colorRampView(lchColor):
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
