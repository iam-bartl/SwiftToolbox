//
//  AnalyticsLogger.swift
//
//
//  Created by Yauhen Rusanau on 14/03/2024.
//

import Foundation
import Helpers

public protocol HasAnalyticsLogger {
    var analyticsLogger: AnalyticsLogger { get }
}

public protocol AnalyticsLogger: Disablable {
    func logEvent(_ event: AnalyticsEvent)
}

public extension AnalyticsLogger {
    var isEnabled: Bool { true }
}

public extension AnalyticsLogger {
    func log(_ name: String, params: [String: Any]? = nil) {
        logEvent(InlineEvent(name: name, params: params))
    }
}

private struct InlineEvent: AnalyticsEvent {
    let name: String
    let params: [String: Any]?
}
