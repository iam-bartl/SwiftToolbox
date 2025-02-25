//
//  AddButton.swift
//  FlashCards
//
//  Created by Yauhen Rusanau on 25/02/2025.
//

import SwiftUI

public struct RoundAddButton: View {
    let action: () -> Void
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .foregroundStyle(.primary)
                .fontWeight(.bold)
                .font(.title2)
                .padding(16)
                .background {
                    Circle().foregroundStyle(addButtonColor)
                        .shadow(radius: 2, y: 2)
                }
        }
    }
}

private extension RoundAddButton {
    var addButtonColor: Color {
        #if os(macOS)
        .secondary
        #else
        .white
        #endif
    }
}

#Preview {
    RoundAddButton() {}
}
