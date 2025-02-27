//
//  AnyView+.swift
//
//
//  Created by Yauhen Rusanau on 14/09/2024.
//

import SwiftUI

public extension View {
    var anyView: AnyView {
        AnyView(self)
    }
}
