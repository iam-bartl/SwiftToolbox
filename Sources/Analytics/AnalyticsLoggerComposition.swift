//
//  AnalyticsServiceComposition.swift
//
//
//  Created by Yauhen Rusanau on 14/03/2024.
//

import Foundation

public class AnalyticsLoggerComposition {
    private let services: [AnalyticsLogger]
    
    public init(services: [AnalyticsLogger]) {
        self.services = services
    }
}

extension AnalyticsLoggerComposition: AnalyticsLogger {
    public func logEvent(_ event: AnalyticsEvent) {
        services.forEach { $0.logEvent(event) }
    }
}
