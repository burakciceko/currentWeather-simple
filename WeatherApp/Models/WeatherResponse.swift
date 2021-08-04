//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Burak Çiçek on 30.07.2021.
//

import Foundation

struct WeatherResponse: Decodable {
    
    var weather: [Weather]
    var temp: Double
    var feelsLike: Double
    var humidity: Int
    var country: String
    var sunrise: Int
    var sunset: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
    
        case weather
        
        case main
        case temp
        case feelsLike = "feels_like"
        case humidity
        
        case sys
        case country
        case sunrise
        case sunset
        
        case name
        
    }
    
    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.weather = try container.decode([Weather].self, forKey: .weather)

        let mainContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .main)
        self.temp = try mainContainer.decode(Double.self, forKey: .temp)
        self.feelsLike = try mainContainer.decode(Double.self, forKey: .feelsLike)
        self.humidity = try mainContainer.decode(Int.self, forKey: .humidity)

        let sysContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .sys)
        self.country = try sysContainer.decode(String.self, forKey: .country)
        self.sunrise = try sysContainer.decode(Int.self, forKey: .sunrise)
        self.sunset = try sysContainer.decode(Int.self, forKey: .sunset)

        self.name = try container.decode(String.self, forKey: .name)
    }
    
}
