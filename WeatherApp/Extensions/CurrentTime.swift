//
//  CurrentTime.swift
//  WeatherApp
//
//  Created by Hakan Or on 11.07.2022.
//

import UIKit

extension Date {
    func getCurrentTime() -> String{
        let today = Date()
        let hours   = (Calendar.current.component(.hour, from: today))
        let minutes = (Calendar.current.component(.minute, from: today))
        let formattedTime = String(hours) + ":" + String(minutes)
        return formattedTime
    }
}
