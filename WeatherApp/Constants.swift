//
//  Constants.swift
//  WeatherApp
//
//  Created by Burak Çiçek on 31.07.2021.
//

import Foundation

let coordinates = WeatherDetailController()

class Network {
    
    var URL_LATITUDE = "51.509865"
    var URL_LONGITUDE = "-0.118092"

    static var API_KEY = "2506e75f9bb46d287e2d40b8e239ffa5"
    var API_URL = "https://api.openweathermap.org/data/2.5/weather?lat=\(Network.U)&lon=\(coordinates.longitude)&appid=\(Network.API_KEY)"
    
    func setLatitudeString(_ latitude: String) {
        URL_LATITUDE = latitude
    }
    
    func setLatitude(_ latitude: Double) {
        setLatitudeString(String(latitude))
    }
    
}


