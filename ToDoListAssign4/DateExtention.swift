//
//  DateExtention.swift
//  ToDoListAssign4
//
//  Created by Shirin Mansouri on 2021-11-08.
//

import Foundation



extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    static var dayAfterTomorrow:  Date { return Date().dayAfterTomorrow }
    static var dayBeforeYesterday:  Date { return Date().dayBeforeYesterday }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var dayAfterTomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 2, to: noon)!
    }
    var dayBeforeYesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -2, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}
