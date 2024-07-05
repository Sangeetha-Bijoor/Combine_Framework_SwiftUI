//
//  Date+Extension.swift
//  NewsApp
//
//  Created by Sangeetha Bijoor on 04/07/24.
//

import Foundation

extension String {

    func getFormattedDate() -> String {
        // Step 1: Parse the original date string
        let isoDateFormatter = DateFormatter()
        isoDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        isoDateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let date = isoDateFormatter.date(from: self) {
            // Step 2: Format the date to the desired string
            let desiredDateFormatter = DateFormatter()
            desiredDateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            desiredDateFormatter.timeZone = TimeZone.current // Use the current time zone if needed
            let formattedDateString = desiredDateFormatter.string(from: date)
            return formattedDateString
        } else {
            return self
        }
    }
}
