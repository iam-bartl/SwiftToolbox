//
//  AddButton.swift
//  FlashCards
//
//  Created by Yauhen Rusanau on 25/02/2025.
//

import SwiftUI

public struct RoundAddButtonView: View {
    public init() {}
    
    public var body: some View {
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

private extension RoundAddButtonView {
    var addButtonColor: Color {
        #if os(macOS)
        .secondary
        #else
        .white
        #endif
    }
}

#Preview {
    RoundAddButtonView()
}
