//
//  ForecastService.swift
//  WeatherApp
//
//  Created by Hakan Or on 13.07.2022.
//

import Alamofire
import Foundation

public final class ForecastService{
    private let API_KEY = "06a36732cd5c081135f8e39496bf4100"
}

struct ForecastInfoResponseBody: Codable {
    let list: [ForecastInfoDaily]
}

struct ForecastInfoDaily: Codable {
    let weather: [ForecastInfoWeather]
    var main : MainResponse
    var dt_txt : String?
    
    struct MainResponse: Codable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
    }
}

struct ForecastInfoWeather: Codable {
    let main: String?
    let description: String?
    let icon: String?
}

extension ForecastInfoDaily.MainResponse{
    var tempC: Int {
        return Int(temp - 273.15)
    }
    var feelsLike: Int {
        return Int(feels_like - 273.15)
    }
    
    var tempmin: Int {
        return Int(temp_min - 273.15)
    }
    
    var tempMax: Int {
        return Int(temp_max - 273.15)
    }
}
    


extension ForecastService {
    
    func fetchForecast(cityName:String, completion: @escaping (ForecastInfoResponseBody) -> Void) {
        let url = "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(API_KEY)"
        AF.request(url)
            .validate()
            .responseDecodable(of: ForecastInfoResponseBody.self) { (response) in
                guard let responseForecast = response.value else { return }
                completion(responseForecast)
        }
  }
}
