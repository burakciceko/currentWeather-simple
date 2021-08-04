//
//  Network.swift
//  WeatherApp
//
//  Created by Burak Çiçek on 31.07.2021.
//

import Foundation

class Network {
    
    static let shared = Network()
    
    var URL_LATITUDE = "51.509865"
    var URL_LONGITUDE = "-0.118092"

    // Enter Your Own API KEY Below (https://openweathermap.org/api)
    //let API_KEY = ""
    
    let URL_BASE = "https://api.openweathermap.org/data/2.5"
    var API_URL_ADDED = ""
    
    //var API_URL = "https://api.openweathermap.org/data/2.5/weather?lat=51.509865&lon=-0.118092&units=metric&appid=2506e75f9bb46d287e2d40b8e239ffa5"
    
    func buildURL() -> String {
        API_URL_ADDED = "/weather?lat=" + URL_LATITUDE + "&lon=" + URL_LONGITUDE + "&units=metric" + "&appid=" + API_KEY
        return URL_BASE + API_URL_ADDED
    }
    
    func setLatitudeString(_ latitude: String) {
        URL_LATITUDE = latitude
    }
    
    func setLatitude(_ latitude: Double) {
        setLatitudeString(String(latitude))
    }
    
    func setLongitudeString(_ longitude: String) {
        URL_LONGITUDE = longitude
    }
    
    func setLongitude(_ longitude: Double) {
        setLongitudeString(String(longitude))
    }
    
}


