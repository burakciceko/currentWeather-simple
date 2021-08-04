//
//  Weather.swift
//  WeatherApp
//
//  Created by Burak Çiçek on 30.07.2021.
//

import Foundation


struct Weather: Decodable {
    
    var description: String
    
    enum CodingKeys: String, CodingKey {
        
        case description
    }
    
}
