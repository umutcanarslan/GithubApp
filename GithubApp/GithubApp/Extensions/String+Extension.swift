//
//  String+Extension.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 4.04.2022.
//

import Foundation

extension String {
    
    func convertToDate() -> Date? {
        let dateFormetter = DateFormatter()
        dateFormetter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormetter.locale = Locale(identifier: "en_US_POSIX")
        dateFormetter.timeZone = .current
        
        return dateFormetter.date(from: self)
    }
    
    func convertDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A"}
        
        return date.convertToMonthAndYear()
    }
    
}
