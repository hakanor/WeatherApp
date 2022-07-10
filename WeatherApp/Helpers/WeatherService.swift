//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Hakan Or on 5.07.2022.
//

import Alamofire
import Foundation

public final class WeatherService{
    private let API_KEY = "06a36732cd5c081135f8e39496bf4100"
}

struct WeatherInfoResponseBody: Decodable {
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension WeatherInfoResponseBody.MainResponse {
    var feelsLike: Int {
        return Int(feels_like - 273.15)
    }
    
    var tempMin: Double {
        return temp_min
    }
    
    var tempMax: Double {
        return temp_max
    }
}

extension WeatherService {
    
    func fetchWeather(cityName:String, completion: @escaping (WeatherInfoResponseBody) -> Void) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(API_KEY)")
            .validate()
            .responseDecodable(of: WeatherInfoResponseBody.self) { (response) in
                guard let responseWeather = response.value else { return }
                completion(responseWeather)
        }
  }
}
