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

struct ResponseBody: Decodable {
//    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

//    struct CoordinatesResponse: Decodable {
//        var lon: Double
//        var lat: Double
//    }

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

//extension ResponseBody.MainResponse {
//    var feelsLike: Double { return feels_like }
//    var tempMin: Double { return temp_min }
//    var tempMax: Double { return temp_max }
//}

extension WeatherService {
    
    func fetchWeather(cityName:String, completion: @escaping (ResponseBody) -> Void) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(API_KEY)")
            .validate()
            .responseDecodable(of: ResponseBody.self) { (response) in
                guard let responseWeather = response.value else { return }
                completion(responseWeather)
        }
  }
}
