//
//  AnalyticsServiceComposition.swift
//
//
//  Created by Yauhen Rusanau on 14/03/2024.
//

import Foundation

public class AnalyticsLoggerComposition {
    private let services: [AnalyticsLogger]
    private let sharedParams: (() -> [String: Any]?)?
    
    public init(services: [AnalyticsLogger], sharedParams: (() -> [String: Any]?)? = nil) {
        self.services = services
        self.sharedParams = sharedParams
    }
}

extension AnalyticsLoggerComposition: AnalyticsLogger {
    public func logEvent(_ event: AnalyticsEvent) {
        let commonParams = sharedParams?() ?? [:]
        let eventParams = event.params ?? [:]
        
        let allParams = commonParams.merging(eventParams, uniquingKeysWith: { _, new in new })
        
        let newEvent = ComposedEvent(name: event.name, params: allParams)
        services.forEach { $0.logEvent(newEvent) }
    }
}

private extension AnalyticsLoggerComposition {
    struct ComposedEvent: AnalyticsEvent {
        let name: String
        let params: [String: Any]?
    }
}
