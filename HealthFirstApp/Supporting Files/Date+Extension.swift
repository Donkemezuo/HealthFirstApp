//
//  Date+Extension.swift
//  HealthFirstApp
//
//  Created by Donkemezuo Raymond Tariladou on 8/12/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

extension String {
    static func convertedDate(fromDate createdDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: createdDate)!
        dateFormatter.dateFormat = "MMM d, yyyy"
        dateFormatter.locale = Locale.current
        let convertedDate = dateFormatter.string(from: date)
        return convertedDate
    }
}
