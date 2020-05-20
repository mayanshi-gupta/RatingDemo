//
//  Date+Extension.swift
//  RatingDemo
//
//  Created by Mayanshi Gupta on 20/05/20.
//  Copyright © 2020 Stamurai. All rights reserved.
//

import Foundation

extension Date {
    func getStringFromDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-yyyy-MM HH:mm:ss"
        return formatter.string(from: self)
    }
}
