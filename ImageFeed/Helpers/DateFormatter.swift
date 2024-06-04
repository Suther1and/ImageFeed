//
//  DateFormatter.swift
//  ImageFeed
//
//  Created by Pavel Barto on 02.06.2024.
//

import Foundation

extension Date {
    var dateTimeString: String { DateFormatter.defaultDateTime.string(from: self) }
}

private extension DateFormatter {
    static let defaultDateTime: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "dd MMMM YYYY"
        return dateFormatter
    }()
}
