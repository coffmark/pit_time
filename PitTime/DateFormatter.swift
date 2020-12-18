//
//  DateFormatter.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/24.
//

import Foundation

struct DateHelper {

    static let instance = DateHelper()

    // MARK: FUNCTIONS
    func extractDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ja_JP")
        let date = dateFromString(dateString: dateString)
        let returnedDate = dateFormatter.string(from: date)
        return returnedDate
    }

    func extractTime(timeString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ja_JP")
        let time = dateFromString(dateString: timeString)
        let returnedTime = dateFormatter.string(from: time)
        return returnedTime
    }

    func stringFromDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        return dateFormatter.string(from: date)
    }

    // MARK: PRIVATE FUNCTION
    private func dateFromString(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        return dateFormatter.date(from: dateString)!
    }
}
