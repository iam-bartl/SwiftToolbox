//
//  AnalyticsEvent.swift
//
//
//  Created by Yauhen Rusanau on 14/03/2024.
//

import Foundation

public enum AnalyticsEventType: String {
    case regular
    case nonfatal
}

public protocol AnalyticsEvent {
    var type: AnalyticsEventType { get }
    var name: String { get }
    var params: [String: Any]? { get }
}

public extension AnalyticsEvent {
    var type: AnalyticsEventType {
        .regular
    }
}
