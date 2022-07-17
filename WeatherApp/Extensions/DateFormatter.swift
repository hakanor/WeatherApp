//
//  DateFormatter.swift
//  WeatherApp
//
//  Created by Hakan Or on 16.07.2022.
//

import Foundation

extension String{
    func timeFormatter(comingDayText:String) -> String {

        let toDateFormatter = DateFormatter()
        toDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = toDateFormatter.date(from: comingDayText)

        var formattedText = "-"

        if let date = date {
            let toStringFormatter = DateFormatter()
            toStringFormatter.dateFormat = "HH:mm"
            formattedText  = toStringFormatter.string(from: date)
        }
        return formattedText
    }
    
    func dayFormatter(comingDayText:String) -> String {

        let toDateFormatter = DateFormatter()
        toDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = toDateFormatter.date(from: comingDayText)

        var formattedText = "-"

        if let date = date {
            let toStringFormatter = DateFormatter()
            toStringFormatter.dateFormat = "EEEE"
            formattedText  = toStringFormatter.string(from: date)
        }
        return formattedText
    }
    
    func dateFormatter(comingDayText:String) -> String {

        let toDateFormatter = DateFormatter()
        toDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = toDateFormatter.date(from: comingDayText)

        var formattedText = "-"

        if let date = date {
            let toStringFormatter = DateFormatter()
            toStringFormatter.dateFormat = "HH:mm E, d MMM y"
            formattedText  = toStringFormatter.string(from: date)
        }
        return formattedText
    }
}

