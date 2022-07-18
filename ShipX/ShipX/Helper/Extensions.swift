//
//  Extensions.swift
//  ShipX
//
//  Created by Fahim Rahman on 16/7/22.
//

import Foundation
import SwiftUI

extension Date {
    
    // date to string convert
    func dateToString(fromDate: Date) -> String {
        
        let formatter = DateFormatter()
        
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateString = formatter.string(from: fromDate)
        
        // convert your string to date
        let convertedStringDate = formatter.date(from: dateString)
        
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MM-yyyy h:mm a"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        
        // again convert your date to string
        return formatter.string(from: convertedStringDate!)
    }
    
//    func currentTimeMillis() -> Int {
//        return Int(self.timeIntervalSince1970 * 1000)
//    }
//
//    func getTimeDateFromTimeStamp(timeStamp : Int) -> String {
//
//        let date = NSDate(timeIntervalSince1970: TimeInterval(timeStamp / 1000))
//
//        let dayTimePeriodFormatter = DateFormatter()
//        dayTimePeriodFormatter.dateFormat = "dd MMM YY, hh:mm a"
//
//        return dayTimePeriodFormatter.string(from: date as Date)
//    }
}


extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
