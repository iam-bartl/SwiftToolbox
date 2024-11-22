//
//  AnalyticsServiceComposition.swift
//
//
//  Created by Yauhen Rusanau on 14/03/2024.
//

import Foundation

public final class AnalyticsLoggerComposition {
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
        let eventParams = event.allParams
        
        let allParams = commonParams.merging(eventParams, uniquingKeysWith: { _, new in new })
        
        let newEvent = ComposedEvent(type: event.type, name: event.name, params: allParams)
        services
            .filter { $0.isEnabled }
            .forEach { $0.logEvent(newEvent) }
    }
}

private extension AnalyticsLoggerComposition {
    struct ComposedEvent: AnalyticsEvent {
        let type: AnalyticsEventType
        let name: String
        let params: [String: Any]?
    }
}

private extension AnalyticsEvent {
    var defaultParams: [String: Any] {
        [
            "event_type": type.rawValue
        ]
    }
    
    var allParams: [String: Any] {
        defaultParams.merging(params ?? [:], uniquingKeysWith: { old, _ in old })
    }
}
