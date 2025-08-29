//
//  Date+.swift
//  
//
//  Created by Yauhen Rusanau on 21/01/2024.
//

import Foundation

public extension Date {
    func adding(_ component: Calendar.Component, value: Int = 1) -> Date {
        guard let date = Calendar.current.date(byAdding: component, value: value, to: self) else {
            preconditionFailure("Can't generate date")
        }
        return date
    }
    
    func distance(to date: Date, in component: Calendar.Component) -> Int {
        let components = Calendar.current.dateComponents([component], from: self, to: date)
        return components.value(for: component) ?? 0
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
    
    func isSameDay(as date: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: date)
    }
}
