//
//  Box.swift
//
//
//  Created by Yauhen Rusanau on 19/12/2023.
//

import Foundation

public final class Box<Value> {
    public var value: Value
    
    public init(_ value: Value) {
        self.value = value
    }
}
