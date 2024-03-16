//
//  AnalyticsEvent.swift
//
//
//  Created by Yauhen Rusanau on 14/03/2024.
//

import Foundation

public protocol AnalyticsEvent {
    var name: String { get }
    var params: [String: Any]? { get }
}
