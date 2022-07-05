//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Hakan Or on 5.07.2022.
//

import Foundation

public final class WeatherService{
    let cityName = "Ankara"
    private let API_KEY = "06a36732cd5c081135f8e39496bf4100"
    
    
    func getWeatherData(cityName:String,API_KEY:String){
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(API_KEY)}"
    }
}
