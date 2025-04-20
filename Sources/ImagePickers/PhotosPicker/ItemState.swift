//
//  ItemState.swift
//
//
//  Created by Yauhen Rusanau on 04/02/2024.
//

import Foundation

enum ItemState {
    case empty
    case loading(Progress)
    case success(Item)
    case failure(Error)
}

extension ItemState {
    var hasContent: Bool {
        if case .success = self {
            return true
        } else {
            return false
        }
    }
}
