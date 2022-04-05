//
//  Date+Extension.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 4.04.2022.
//

import Foundation

extension Date {
    
    func convertToMonthAndYear() -> String {
        let dateFormetter = DateFormatter()
        dateFormetter.dateFormat = "MMMM yyyy"
        
        return dateFormetter.string(from: self)
    }
    
}
