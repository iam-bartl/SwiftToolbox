//
//  AnalyticsLogger.swift
//
//
//  Created by Yauhen Rusanau on 14/03/2024.
//

import Foundation

public protocol HasAnalyticsLogger {
    var analyticsLogger: AnalyticsLogger { get }
}

public protocol AnalyticsLogger {
    func logEvent(_ event: AnalyticsEvent)
}
