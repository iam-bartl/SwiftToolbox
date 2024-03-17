//
//  AnalyticsLoggerMock.swift
//
//
//  Created by Yauhen Rusanau on 17/03/2024.
//

import Foundation

public final class AnalyticsLoggerMock: AnalyticsLogger {
    public init() {}
    
    public func logEvent(_ event: any AnalyticsEvent) {
    }
}
