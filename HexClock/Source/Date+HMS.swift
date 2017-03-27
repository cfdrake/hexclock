//
//  Date+HMS.swift
//  HexClock
//

import Foundation

extension Date {

    /// A tuple of (hour, minute, second) representing the time component of this date.
    var timeComponents: (Int, Int, Int) {
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: self)

        guard let hour = components.hour,
            let minute = components.minute,
            let second = components.second else { fatalError("Could not parse date") }

        return (hour, minute, second)
    }

}
